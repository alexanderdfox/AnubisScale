import Foundation

// MARK: - AnubisScale Core

func anubisScaleEnergy(bits: String) -> Double {
    let length = Double(bits.count)
    guard length > 0 else { return 0.0 }

    let ones = Double(bits.filter { $0 == "1" }.count)
    let p1 = ones / length
    let p0 = 1.0 - p1

    var entropy = 0.0
    if p1 > 0 {
        entropy -= p1 * log2(p1)
    }
    if p0 > 0 {
        entropy -= p0 * log2(p0)
    }

    let maxEntropy = 1.0
    return maxEntropy - entropy
}

func bytesToBits(_ data: Data) -> String {
    return data.map { String($0, radix: 2).leftPadding(toLength: 8, withPad: "0") }.joined()
}

extension String {
    func leftPadding(toLength: Int, withPad: String) -> String {
        let padCount = toLength - self.count
        if padCount <= 0 { return self }
        return String(repeating: withPad, count: padCount) + self
    }
}

// MARK: - File Comparison

func computeAverageAnubisScale(for path: String) -> Double {
    guard let handle = FileHandle(forReadingAtPath: path) else {
        print("[!] Cannot open file: \(path)")
        return 0.0
    }

    defer { handle.closeFile() }

    let chunkSize = 4096
    var totalEnergy = 0.0
    var count = 0

    while autoreleasepool(invoking: {
        let chunk = handle.readData(ofLength: chunkSize)
        guard !chunk.isEmpty else { return false }

        let bits = bytesToBits(chunk)
        let energy = anubisScaleEnergy(bits: bits)
        totalEnergy += energy
        count += 1
        return true
    }) {}

    return count > 0 ? totalEnergy / Double(count) : 0.0
}

func compareFiles(file1: String, file2: String) {
    print("⚖️  AnubisScale: Weighing File Energies")
    print(" - File 1: \(file1)")
    print(" - File 2: \(file2)\n")

    let energy1 = computeAverageAnubisScale(for: file1)
    let energy2 = computeAverageAnubisScale(for: file2)

    print("📊 Results:")
    print(" - \(file1): AnubisScale Energy = \(String(format: "%.4f", energy1))")
    print(" - \(file2): AnubisScale Energy = \(String(format: "%.4f", energy2))")

    if energy1 > energy2 {
        print("⚠️ \(file1) is more structured (higher AnubisScale Energy — potential payload or signal)")
    } else if energy2 > energy1 {
        print("⚠️ \(file2) is more structured (higher AnubisScale Energy — potential payload or signal)")
    } else {
        print("✅ Both files show similar structural entropy")
    }
}

// MARK: - CLI Entrypoint

let args = CommandLine.arguments
guard args.count == 3 else {
    print("Usage: AnubisScale <file1> <file2>")
    exit(1)
}

let path1 = args[1]
let path2 = args[2]

compareFiles(file1: path1, file2: path2)
