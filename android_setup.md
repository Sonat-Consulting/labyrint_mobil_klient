## Step 1: Install Flutter SDK

### 1. Download Flutter SDK

- Go to: https://docs.flutter.dev/install/manual
- Choose your OS (Windows, macOS, Linux).
- Download the Flutter SDK ZIP file.

### 2. Extract and Setup PATH

- Extract the zip to a location, e.g., `C:\src\flutter` (Windows) or `~/flutter` (macOS/Linux).
- Add Flutter to your system PATH:

**On Windows:**

1. Search for “Environment Variables” > Edit environment variables.
2. Under User variables, select PATH > Edit.
3. Add new entry: `C:\src\flutter\bin` (adjust path if different).
4. Click OK to save.

**On macOS/Linux:**

- Open terminal and add to `~/.bashrc`, `~/.zshrc`, or `~/.profile`:

```bash
  export PATH="$PATH:/path/to/flutter/bin"
```

## Step 2: Android SDK and emulator

### 1: Download Command Line Tools

1. Go to the [Android Studio downloads page](https://developer.android.com/studio#command-line-tools-only).
2. Download the package for your OS:
   - Windows: `commandlinetools-win.zip`
   - Mac: `commandlinetools-mac.zip`
   - Linux: `commandlinetools-linux.zip`
3. Extract the ZIP file to a directory of your choice, e.g., `~/android/cmdline-tools`.

### 2: Set Up Environment Variables

Add the SDK `cmdline-tools/bin` directory to your PATH.

Example for Linux/macOS (add to `.bashrc` or `.zshrc`):

```bash
export ANDROID_SDK_ROOT=$HOME/android
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/tools/bin
```

### 3: Install SDK Components

sdkmanager --sdk_root=$ANDROID_SDK_ROOT "platform-tools" "emulator" "system-images;android-33;google_apis;x86_64" "platforms;android-33" "build-tools;33.0.0"

### 4: Create an Android Virtual Device

avdmanager create avd -n myEmulator -k "system-images;android-33;google_apis;x86_64" --device "pixel"

### 5: Launch the Emulator

emulator -avd myEmulator

## 3: Launch test app

run `flutter clean` and `flutter run` from root folder
