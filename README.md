🗂️ Repository Structure
react-native-macos-setup/
│
├── setup-react-native-macos.sh    # Auto-install script
├── README.md                      # Complete documentation
└── LICENSE                        # MIT license

🧾 README.md (full content)
# React Native macOS Setup Script (Sonoma / Intel)

A one-shot shell script to set up a **React Native development environment** on **macOS Sonoma (Intel)** with the latest stable tools:
- Java (OpenJDK 17)
- Android SDKs (API 35 and 36)
- NDKs for both SDKs
- Node.js, Watchman, Yarn, and React Native CLI

---

## 🚀 Features

✅ Installs and configures **JDK 17**  
✅ Sets `JAVA_HOME`, `ANDROID_HOME`, and updates your shell PATH  
✅ Installs Android Command-Line Tools, SDK 35 + 36, and NDKs  
✅ Installs Node.js, Yarn, Watchman, React Native CLI  
✅ Compatible with macOS **Sonoma (Intel)**  
✅ Verified for **React Native 0.75+**

---

## 🧩 Installation

### 1️⃣ Clone the repository
```bash
git clone https://github.com/<your-username>/react-native-macos-setup.git
cd react-native-macos-setup

2️⃣ Make the script executable
chmod +x setup-react-native-macos.sh

3️⃣ Run the setup
./setup-react-native-macos.sh

4️⃣ Apply the environment variables
source ~/.zshrc

⚙️ Verifying Installation

Check versions to confirm successful setup:

java -version
adb version
sdkmanager --list | grep "platforms;"
npx react-native doctor


Expected output:

Java: openjdk 17.0.x

Android SDK: platform 35 and 36 listed

React Native doctor passes environment checks

📱 Optional: Create Emulator

To create a Pixel 8 Android 15 (API 35) emulator:

sdkmanager "system-images;android-35;google_apis;x86_64"
avdmanager create avd -n Pixel_8_API_35 -k "system-images;android-35;google_apis;x86_64" --device "pixel_8"
emulator -avd Pixel_8_API_35 &

🧠 Common Issues

Q: Unable to locate a Java Runtime
A: Ensure your .zshrc contains:

export JAVA_HOME=/usr/local/Cellar/openjdk@17/17.0.17/libexec/openjdk.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH


Q: adb: command not found
A: Make sure platform-tools is installed:

sdkmanager "platform-tools"

📜 License

This project is licensed under the MIT License
.

👨‍💻 Author

Sathish Kumar Bhimanapally (Bhima Innovations)
React Native & Cloud Solutions Architect


---

## 📄 **setup-react-native-macos.sh**
(Already the final script from our last message — I’ll include it verbatim in the repo.)

---

# Accept Android SDK Licenses
yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses

# Install Required SDK Components
sdkmanager --install \
  "platform-tools" \
  "platforms;android-35" \
  "platforms;android-36" \
  "build-tools;35.0.0" \
  "ndk;27.1.12297006"


## 🪪 **LICENSE (MIT)**

```text
MIT License

Copyright (c) 2025 Sathish Kumar Bhimanapally

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
