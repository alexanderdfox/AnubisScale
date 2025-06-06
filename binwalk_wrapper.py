#!/usr/bin/env python3
import subprocess
import hashlib
import os
import shutil
import sys

MAX_DEPTH = 5          # Max recursive depth
TIMEOUT = 60           # seconds per binwalk call
HASHED_FILES = set()   # To track duplicates

def sha256sum(filename):
    h = hashlib.sha256()
    with open(filename, "rb") as f:
        for chunk in iter(lambda: f.read(8192), b""):
            h.update(chunk)
    return h.hexdigest()

def run_binwalk(file_path, depth=0):
    if depth > MAX_DEPTH:
        print(f"[!] Max recursion depth {MAX_DEPTH} reached. Stopping.")
        return

    file_hash = sha256sum(file_path)
    if file_hash in HASHED_FILES:
        print(f"[!] Duplicate file detected by hash. Skipping recursion: {file_path}")
        return

    HASHED_FILES.add(file_hash)

    outdir = file_path + ".extracted"
    if os.path.exists(outdir):
        shutil.rmtree(outdir)

    print(f"[+] Running binwalk on {file_path} (depth {depth})")
    try:
        subprocess.run(
            ["timeout", str(TIMEOUT), "binwalk", "-eM", file_path],
            check=True,
        )
    except subprocess.CalledProcessError:
        print(f"[!] Binwalk failed or timed out on {file_path}")

    if not os.path.exists(outdir):
        print(f"[i] No extracted files for {file_path}")
        return

    for root, dirs, files in os.walk(outdir):
        for fname in files:
            fpath = os.path.join(root, fname)
            if os.path.getsize(fpath) < 1024:
                continue
            run_binwalk(fpath, depth + 1)

def main():
    if len(sys.argv) < 2:
        print("Usage: ./binwalk_wrapper.py <file>")
        sys.exit(1)

    target_file = sys.argv[1]
    if not os.path.isfile(target_file):
        print(f"File not found: {target_file}")
        sys.exit(1)

    run_binwalk(target_file)
    print("[+] Done.")

if __name__ == "__main__":
    main()
