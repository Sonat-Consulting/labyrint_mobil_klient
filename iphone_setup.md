## Step 1: Install Flutter SDK

### 1. Download Flutter SDK

- Go to: https://docs.flutter.dev/install/manual
- Choose your OS (Windows, macOS, Linux).
- Download the Flutter SDK ZIP file.

### 2. Extract and Setup PATH

- Extract the zip to a location, e.g., `C:\src\flutter` (Windows) or `~/flutter` (macOS/Linux).
- Add Flutter to your system PATH:

**On macOS/Linux:**

- Open terminal and add to `~/.bashrc`, `~/.zshrc`, or `~/.profile`:

```bash
  export PATH="$PATH:/path/to/flutter/bin"
```

## 2: Install Xcode

- `https://developer.apple.com/documentation/safari-developer-tools/installing-xcode-and-simulators``
- install at least one ios simulator

## 3: Launch app

- run `flutter clean` and `flutter build ios` from root folder
- run `open ios/Runner.xcworkspace`

### 1: Set up developer account (if you don't have an developer account)

- in Xcode go to `Runner` at top level in navigator
- open `Signing & Capabilities` and choose `Add an account...`
- Sign in with your Apple ID
- Click `Manage Certificate...`
- Click the `+` button in bottom left corner and `Apple development`
- Go back to main Xcode window and in `Team` select your newly created account

### 3: Launch the app in emulator

- Launch the app from Xcode at the play button
