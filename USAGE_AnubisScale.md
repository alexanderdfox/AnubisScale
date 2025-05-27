# AnubisScale Usage Guide

## Overview

**AnubisScale** is a Swift command-line tool that measures the **information structure** (entropy) of files by calculating their **AnubisScale Energy** — a metric inspired by Maxwell’s Demon and symbolic of Anubis weighing the heart. 

It compares two files and reports which one has more informational order (lower entropy), useful in cybersecurity for detecting suspicious, encoded, or obfuscated data.

---

## Requirements

- macOS or Linux with Swift 5+ installed  
- Command line / Terminal access

---

## Installation

1. Save `AnubisScale.swift` to your local machine.

2. Open Terminal and navigate to the folder containing `AnubisScale.swift`.

3. Compile the tool using:

```bash
swiftc AnubisScale.swift -o anubis
```

This creates an executable named `anubis`.

---

## Usage

Run the tool with two file paths as arguments:

```bash
./anubis <file1> <file2>
```

### Example:

```bash
./anubis suspicious_payload.bin normal_log.bin
```

---

## Output Explanation

- **AnubisScale Energy**: A value from 0 to 1 representing the degree of structure/order in the file's binary data.  
- Higher energy means **more predictable, structured data**, which may indicate encoded or packed payloads.  
- Lower energy suggests **random or noisy data**, typical of compressed/encrypted files or normal noise.

The tool prints which file is more "structured" or if both have similar entropy levels.

---

## Practical Uses

- Malware vs clean file detection  
- Obfuscation or payload spotting  
- Forensic binary analysis  
- File classification by entropy signature  

---

## Troubleshooting

- **Cannot open file**: Ensure the file path is correct and you have read permissions.  
- **Swift compiler errors**: Make sure Swift 5+ is installed (`swift --version`).  
- **Permissions issues**: Run `chmod +x anubis` if needed.

---

## Future Enhancements

- GUI app with drag-and-drop comparison  
- Directory batch scanning  
- Real-time network payload analysis  

---

## License

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---

If you have questions or want to request features, feel free to ask!
