# 🔍 AnubisScale vs. Other Entropy & File Analysis Tools

AnubisScale is a Swift-based file analysis tool that evaluates entropy, usable information energy, and supports machine learning classification. Below is a feature comparison against other well-known entropy or file-analysis tools.

---

## 🧭 Comparison Table

| Feature                                 | AnubisScale        | binwalk          | entropy (by Didier Stevens) | radare2 + rahash2     | CyberChef         |
|----------------------------------------|--------------------|------------------|------------------------------|------------------------|-------------------|
| Language                               | Swift              | Python/C         | VBScript                     | C                      | JavaScript        |
| GUI                                    | Planned (SwiftUI)  | No               | No                           | No                     | Yes (Web-based)   |
| Shannon Entropy                        | ✅                 | ✅               | ✅                           | ✅                     | ✅                |
| Usable Information Energy (HeartScale) | ✅ *(unique)*       | ❌               | ❌                           | ❌                     | ❌                |
| Compare Two Files                      | ✅                 | ❌               | ❌                           | ✅ *(manual)*           | ❌                |
| Machine Learning Classification        | ✅ *(CoreML-ready)* | ❌               | ❌                           | ❌                     | ❌                |
| File Format Agnostic                   | ✅                 | ✅               | ✅                           | ✅                     | ✅                |
| Compression/Encryption Detection       | Partial (ML)       | ✅               | Limited                      | Partial                | ✅                |
| CLI Support                            | ✅                 | ✅               | ✅                           | ✅                     | ❌ *(GUI only)*   |
| Scriptable/Automatable                 | ✅                 | ✅               | ✅                           | ✅                     | ✅ *(via Web)*    |
| Open Source                            | ✅ (MIT)           | ✅               | ✅                           | ✅                     | ✅                |
| Platform                               | macOS (native)     | Cross-platform   | Windows                      | Cross-platform         | Browser           |

---

## 🧠 Unique Selling Points of AnubisScale

- **Symbolic entropy modeling:** Calculates usable energy metaphorically as “weight of the heart” (HeartScale), inspired by Maxwell’s Demon and Egyptian mythology.
- **CoreML-ready classification:** Can detect anomalies or categorize files using trained machine learning models.
- **Swift-native for macOS:** Optimized for macOS CLI and GUI integration using CoreML and SwiftUI.
- **Ideal for cybersecurity research, malware triage, and entropy fingerprinting.**

---

## 🔧 In Development

- SwiftUI GUI with live entropy heatmaps  
- Multi-file batch comparison  
- Visualization of entropy vs. structure  
- Custom CoreML training and model import support

---

## 📝 References

- [Binwalk](https://github.com/ReFirmLabs/binwalk)  
- [Didier Stevens’ entropy tool](https://blog.didierstevens.com/programs/)  
- [Radare2](https://rada.re/n/) + [rahash2](https://github.com/radareorg/radare2)  
- [CyberChef](https://gchq.github.io/CyberChef/)

---

For full usage instructions, see `usage.md`.  
To contribute or suggest a tool for comparison, open an issue or pull request.
