# Safe Binwalk Wrapper

A Python wrapper for [binwalk](https://github.com/ReFirmLabs/binwalk) that prevents infinite recursion and resource exhaustion when extracting firmware or self-referential binaries.

## Features

- Tracks extracted file SHA256 hashes to avoid reprocessing duplicates
- Limits recursion depth to avoid infinite extraction loops
- Uses `timeout` to limit per-extraction runtime
- Cleans up extracted folders before re-extracting
- Easy to extend with entropy filtering and resource limits

## Usage

```bash
chmod +x binwalk_wrapper.py
./binwalk_wrapper.py firmware.bin
```

## Requirements

- Python 3
- `binwalk` installed and in your system PATH
- `timeout` command available (usually on Linux/macOS)

## Why?

Tools like binwalk do not protect against recursive self-extracting binaries or maliciously crafted files that cause infinite extraction loops. This wrapper adds simple safeguards to make your analysis safer.

## License

MIT License
