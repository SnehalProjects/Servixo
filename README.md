# Servixo 🛠️

Servixo is a **Flutter-based service marketplace mobile application** designed as a scalable template for home service booking platforms.  
It includes core user flows such as onboarding, authentication, service browsing, scheduling, and profile management, with **Firebase integration** for backend services.

---

## ✨ Features

- Onboarding flow
- Email & password authentication (Firebase Auth)
- User profile creation and update
- Service categories  
  *(Electrician, Plumber, Carpenter, Cleaning, etc.)*
- Appointment scheduling screen
- Settings screen and structured app navigation

---

## 🧰 Tech Stack

- **Flutter**
- **Dart**
- **Firebase**
  - Authentication
  - Cloud Firestore

---

## 📋 Prerequisites

- Flutter SDK (Stable channel)  
  👉 https://docs.flutter.dev/get-started/install
- Android Studio / Xcode (for platform builds)
- A Firebase project (Auth, Firestore, etc.)

---

## 🚀 Quick Setup

### 1️⃣ Clone the repository
```bash
git clone <your-repo-url>
cd servixo2
2️⃣ Install dependencies
bash
Copy code
flutter pub get
3️⃣ Configure Firebase
Android

Add google-services.json to android/app/

iOS

Add GoogleService-Info.plist to ios/Runner/

Open ios/Runner.xcworkspace in Xcode and configure Firebase

Web / macOS

Follow Firebase documentation if required

4️⃣ Firebase initialization
Already implemented in lib/main.dart:

dart
Copy code
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
5️⃣ Run the application
bash
Copy code
flutter run
🛠️ Useful Commands
Command	Description
flutter pub get	Install dependencies
flutter run	Run on connected device
flutter build apk --release	Build Android APK
flutter build appbundle	Build Android App Bundle
flutter build ios	Build iOS app (macOS only)

🔥 Firebase Notes
Ensure the package name / bundle ID matches Firebase Console settings.

Keep google-services.json and GoogleService-Info.plist out of version control if they contain sensitive data.

Add these files to .gitignore when necessary.

For iOS, run:

bash
Copy code
cd ios
pod install
📁 Project Structure (High Level)
text
Copy code
lib/
 ├── main.dart          # App entry point
 ├── Screens/           # UI screens
 │    ├── Onboarding
 │    ├── Login
 │    ├── Signup
 │    ├── Home
 │    ├── Profile
 │    ├── Categories
 │    ├── Schedule
 │    └── Settings
assets/
android/
ios/
windows/
macos/
🧪 Troubleshooting
Run flutter pub get if dependencies are missing.

Restart the IDE if Dart analyzer fails.

Ensure Firebase is initialized before calling runApp().

🤝 Contributing
Contributions are welcome!

Fork the repository

Create a new branch

Commit your changes

Open a Pull Request

Ensure code is formatted using:

bash
Copy code
flutter format .
📜 License
This project currently does not include a license file.
Add a license if you plan to distribute or publish the project.

👨‍💻 Team
Snehal Mishra

Sarvangi

yaml
Copy code

---

## ✅ How to use this
1. Open your GitHub repo  
2. Click **README.md → Edit (✏️ icon)**
3. **Paste everything above**
4. Commit changes

---

If you want next:
- 📸 **Add screenshots section**
- 🎯 Make it **resume-ready**
- 🔐 Add `.env` + secure Firebase setup
- ⭐ Improve GitHub profile visibility

Just say the word 🚀
