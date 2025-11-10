#!/bin/bash
set -e

echo "=============================="
echo " React Native Setup - macOS Sonoma (Intel)"
echo "=============================="

# Check Homebrew
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating Homebrew..."
brew update

# -----------------------------
# Install JDK 17
# -----------------------------
echo "Installing OpenJDK 17..."
brew install openjdk@17

# Define correct JDK path
JDK_PATH="/usr/local/Cellar/openjdk@17/$(brew list --versions openjdk@17 | awk '{print $2}')/libexec/openjdk.jdk/Contents/Home"

echo "Setting JAVA_HOME..."
echo "export JAVA_HOME=${JDK_PATH}" >> ~/.zshrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
source ~/.zshrc

echo "✅ JAVA_HOME set to: $JAVA_HOME"
java -version || echo "⚠️ Java not detected yet. Run 'source ~/.zshrc' after installation."

# -----------------------------
# Install Android Command-Line Tools
# -----------------------------
ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
mkdir -p "$ANDROID_SDK_ROOT/cmdline-tools"

echo "Downloading Android Command Line Tools..."
cd "$ANDROID_SDK_ROOT/cmdline-tools"
curl -o commandlinetools-mac.zip https://dl.google.com/android/repository/commandlinetools-mac-11076708_latest.zip
unzip -qo commandlinetools-mac.zip
mv cmdline-tools latest
rm -f commandlinetools-mac.zip

echo "Setting ANDROID_SDK_ROOT..."
echo "export ANDROID_SDK_ROOT=$ANDROID_SDK_ROOT" >> ~/.zshrc
echo "export ANDROID_HOME=$ANDROID_SDK_ROOT" >> ~/.zshrc
echo 'export PATH=$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH' >> ~/.zshrc
source ~/.zshrc

# -----------------------------
# Install SDK Platforms, Build Tools & NDKs
# -----------------------------
echo "Installing Android SDKs, Build Tools, and NDKs..."
yes | "$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager" --licenses

"$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager" --install \
  "platform-tools" \
  "build-tools;35.0.0" \
  "build-tools;36.0.0" \
  "platforms;android-35" \
  "platforms;android-36" \
  "ndk;26.3.11579264" \
  "ndk;27.0.12077973" \
  "cmake;3.22.1" \
  "emulator" \
  "sources;android-35" \
  "sources;android-36"

# -----------------------------
# Install Node, Watchman, Yarn, and React Native CLI
# -----------------------------
echo "Installing Node.js, Watchman, and React Native CLI..."
brew install node watchman
npm install -g yarn react-native-cli

# -----------------------------
# Verify Installations
# -----------------------------
echo "Verifying installations..."
echo "Java version:"
java -version

echo "Android SDK location:"
echo "$ANDROID_SDK_ROOT"

echo "Installed SDK platforms:"
ls "$ANDROID_SDK_ROOT/platforms" || true

echo "NDKs installed:"
ls "$ANDROID_SDK_ROOT/ndk" || true

# -----------------------------
# Final Instructions
# -----------------------------
echo "=============================="
echo "✅ React Native environment setup complete!"
echo "=============================="
echo "👉 Run the following commands to finalize:"
echo "   source ~/.zshrc"
echo "   npx react-native doctor"
echo ""
echo "To create a new project:"
echo "   npx react-native init MyApp"
echo "   cd MyApp"
echo "   npx react-native run-android"

