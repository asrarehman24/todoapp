# **Flutter Learning Projects: Week 1-3**

## **Overview**

This repository contains Flutter projects developed over **Weeks 1 to 3** as part of a practical learning program. The focus is on learning **UI creation, state management, persistent storage**, and building a **Task Management App**.

---

## **Week 1: Basic Flutter UI and Navigation**

### **App Description**

A **Login App** with simple UI:

* Login screen with **email** and **password** fields.
* **Login button** and "Forgot Password?" link.
* Navigation to **Home Screen** using `Navigator.push()`.

### **Features**

* Basic layout using `Column`, `Row`, `Container`.
* Input validation:

  * Email must be in proper format.
  * Password cannot be empty.
* Navigation between screens.

### **Screenshots**

![LoginView](<Screenshot 2025-11-26 190321.png>)

---

## **Week 2: Data Management and Persistent Storage**

### **App Description**

A **Todo List App** with **state management** and **persistent storage** using `SharedPreferences`:

* Add tasks to a list.
* Tasks persist even after app restart.
* Basic counter app using `setState` to learn state management.

### **Features**

* State management using `setState`.
* Persistent storage via `SharedPreferences`.
* Simple ListView to display tasks.
* Counter app demonstrating basic state changes.
* Add tasks only (delete feature is not included for Week 2).
### **Screenshots**
![Counter App](<Screenshot 2025-11-26 191735.png>)
---

## **Week 3: Final Task Management App**

### **App Description**

A **Task Management App** combining everything learned:

* Add, delete, and mark tasks as complete.
* Tasks are saved persistently using `SharedPreferences`.
* Custom AppBar with title and **add task button**.

### **Features**

* Add tasks through a dialog.
* Delete tasks.
* Mark tasks as complete (with checkbox + strikethrough text).
* Data persistence with SharedPreferences.
* Custom AppBar with icons for better UI.

### **Screenshots**
![Task Manager](<Screenshot 2025-11-26 191540.png>)

---

## **Week 4: HTTP Requests and API Integration**

### **App Description**

Enhanced the Task Management App with **HTTP requests** and **API integration**:

* Fetch data from public APIs (JSONPlaceholder).
* Parse JSON responses.
* Display data in ListView.
* User Profile Screen with API data.
* Robust error handling and loading indicators.

### **Features**

* **HTTP Requests**: Using the `http` package to fetch posts and user data.
* **JSON Parsing**: Automatic parsing of API responses.
* **ListView Display**: Posts displayed in a scrollable list with cards.
* **User Profile Screen**: Displays user details including name, email, and contact info.
* **Error Handling**: Comprehensive error messages for failed requests.
* **Loading Indicators**: Circular progress indicators during data fetching.
* **Retry Functionality**: Users can retry failed requests.

### **API Endpoints Used**

* `https://jsonplaceholder.typicode.com/posts` - Fetch posts
* `https://jsonplaceholder.typicode.com/users` - Fetch users
* `https://jsonplaceholder.typicode.com/users/{id}` - Fetch single user

### **Navigation**

Access the new features through the menu button (three dots) in the Task Manager app bar:
* **API Demo**: View posts from the API
* **User Profile**: View user profile information

---

## **Week 5: Firebase Authentication and Firestore**

### **App Description**

Enhanced the Task Management App with **Firebase Authentication** and **Cloud Firestore**:

* Email/Password authentication with Firebase Auth.
* User registration and login screens.
* Store user profiles in Cloud Firestore.
* Retrieve and display user data from Firestore.
* Automatic navigation to user profile after login.

### **Features**

* **Firebase Authentication**: Secure email/password authentication.
* **User Registration**: Sign up with name, email, and password.
* **User Login**: Sign in with existing credentials.
* **Firestore Integration**: Store and retrieve user profile data.
* **Authentication State**: Automatic navigation based on auth state.
* **Profile Management**: View and manage user profile information.
* **Sign Out**: Secure logout functionality.

### **Firebase Setup Required**

#### **1. Create Firebase Project**
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project" or "Add project"
3. Enter project name (e.g., "todoapp-firebase")
4. Enable Google Analytics (optional)
5. Choose Google Analytics account or create new

#### **2. Enable Authentication**
1. In Firebase Console, go to "Authentication"
2. Click "Get started"
3. Go to "Sign-in method" tab
4. Enable "Email/Password" provider
5. Click "Save"

#### **3. Enable Firestore**
1. In Firebase Console, go to "Firestore Database"
2. Click "Create database"
3. Choose "Start in test mode" (for development)
4. Select location for your database
5. Click "Done"

#### **4. Configure Flutter App**
1. Install FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   ```

2. Configure Firebase for your project:
   ```bash
   flutterfire configure
   ```
   - Select your Firebase project
   - Select platforms (Android, iOS, Web)
   - This will generate `firebase_options.dart` and update native config files

#### **5. Update Firebase Config**
Replace the placeholder values in `lib/firebase_options.dart` with the actual values from your Firebase project.

#### **6. Add Config Files**
- **Android**: Place `google-services.json` in `android/app/`
- **iOS**: Place `GoogleService-Info.plist` in `ios/Runner/`
- **Web**: Update `web/index.html` with Firebase config

### **Authentication Flow**

1. **App Start**: Shows login screen
2. **Sign Up**: Create new account → Profile saved to Firestore → Navigate to home
3. **Sign In**: Login with credentials → Navigate to home
4. **Profile**: Access user profile from menu → View stored data
5. **Sign Out**: Logout → Return to login screen

### **Firestore Data Structure**

```
users/{userId}
├── name: string
├── email: string
└── createdAt: timestamp
```

---

## **Setup Instructions**

### **Prerequisites**

* Flutter SDK installed: [Flutter Install Guide](https://docs.flutter.dev/get-started/install)
* VS Code or Android Studio
* Git (for version control)
* Firebase account (for Week 5 features)

### **Clone the Repository**

```bash
git clone https://github.com/asrarehman24/todoapp.git
cd todoapp
```

### **Install Dependencies**

```bash
flutter pub get
```

### **Firebase Setup (Required for Week 5)**

#### **Step 1: Create Firebase Project**
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project" or "Add project"
3. Enter project name (e.g., "todoapp-firebase")
4. Enable Google Analytics (optional)
5. Choose Google Analytics account or create new

#### **Step 2: Enable Authentication**
1. In Firebase Console, go to "Authentication"
2. Click "Get started"
3. Go to "Sign-in method" tab
4. Enable "Email/Password" provider
5. Click "Save"

#### **Step 3: Enable Firestore**
1. In Firebase Console, go to "Firestore Database"
2. Click "Create database"
3. Choose "Start in test mode" (for development)
4. Select location for your database
5. Click "Done"

#### **Step 4: Configure Flutter App**
1. Install FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   ```

2. Configure Firebase for your project:
   ```bash
   flutterfire configure
   ```
   - Select your Firebase project
   - Select platforms (Android, iOS, Web)
   - This will generate `firebase_options.dart` and update native config files

#### **Step 5: Deploy Firestore Rules**
```bash
firebase use your-project-id
firebase deploy --only firestore:rules
```

### **Run the App**

#### **For Android:**
```bash
flutter run
```

#### **For iOS:**
```bash
flutter run
```

#### **For Web:**
```bash
flutter run -d chrome
```

### **Build for Production**

#### **Android APK:**
```bash
flutter build apk --release
```

#### **iOS (on macOS):**
```bash
flutter build ios --release
```

### **Project Structure**

```
todoapp/
├── android/                 # Android native code
├── ios/                     # iOS native code
├── lib/                     # Flutter source code
│   ├── main.dart           # App entry point
│   ├── firebase_options.dart # Firebase configuration
│   ├── models/             # Data models
│   │   └── task.dart       # Task model
│   ├── screens/            # UI screens
│   │   ├── login_screen.dart      # Authentication
│   │   ├── home_screen.dart       # Task management
│   │   ├── api_demo_screen.dart   # API demonstration
│   │   └── user_profile_screen.dart # User profile
│   └── services/           # Business logic
│       ├── api_service.dart       # HTTP API calls
│       └── firebase_service.dart  # Firebase operations
├── test/                   # Unit tests
├── firestore.rules         # Firestore security rules
├── firebase.json          # Firebase configuration
└── pubspec.yaml           # Dependencies
```

### **Environment Setup**

#### **Android Development:**
- Android Studio with Android SDK
- Android device or emulator
- Minimum SDK: API 23 (Android 6.0)

#### **iOS Development (macOS only):**
- Xcode 15+
- iOS Simulator or physical device
- CocoaPods installed

#### **Web Development:**
- Chrome browser
- Web server for hosting

### **Troubleshooting**

#### **Common Issues:**

**1. Firebase Permission Denied:**
```bash
# Deploy Firestore rules
firebase deploy --only firestore:rules
```

**2. Android Build Issues:**
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter build apk --debug
```

**3. iOS Build Issues:**
```bash
# Clean iOS build
flutter clean
cd ios
pod install
cd ..
flutter build ios
```

**4. Firebase Configuration:**
- Ensure `google-services.json` is in `android/app/`
- Ensure `GoogleService-Info.plist` is in `ios/Runner/`
- Verify `firebase_options.dart` has correct values

**5. Network Issues:**
- Check internet connection
- Verify API endpoints are accessible
- Check Firebase project status

#### **Debug Commands:**
```bash
# Check Flutter setup
flutter doctor

# Check connected devices
flutter devices

# Run with verbose logging
flutter run --verbose

# Clean all caches
flutter clean
flutter pub cache clean
```

### **Testing**

#### **Run Unit Tests:**
```bash
flutter test
```

#### **Run Integration Tests:**
```bash
flutter drive --target=test_driver/app.dart
```

### **Deployment**

#### **Firebase Hosting (Web):**
```bash
flutter build web
firebase deploy --only hosting
```

#### **Google Play Store:**
1. Build release APK: `flutter build apk --release`
2. Sign the APK with your keystore
3. Upload to Google Play Console

#### **App Store (iOS):**
1. Build for iOS: `flutter build ios --release`
2. Open Xcode and archive the app
3. Upload to App Store Connect

## **Notes**

* **Week 1**: Focuses on **UI creation** and **navigation** basics
* **Week 2**: Introduces **state management** and **persistent storage** with SharedPreferences
* **Week 3**: Combines all concepts into a functional **Task Management App**
* **Week 4**: Adds **HTTP requests** and **API integration** with error handling
* **Week 5**: Implements **Firebase Authentication** and **Cloud Firestore** integration

### **Technologies Used**

* **Framework**: Flutter
* **Language**: Dart
* **State Management**: setState, Provider pattern
* **Local Storage**: SharedPreferences
* **Network**: HTTP package, Dio
* **Backend**: Firebase Authentication, Cloud Firestore
* **Database**: Firestore (NoSQL), SharedPreferences (local)

### **Architecture**

* **MVVM Pattern**: Separation of concerns
* **Service Layer**: API calls and business logic
* **Repository Pattern**: Data access abstraction
* **Widget Composition**: Reusable UI components

### **Best Practices Implemented**

* **Error Handling**: Comprehensive try-catch blocks
* **Loading States**: User feedback during async operations
* **Input Validation**: Form validation with proper error messages
* **Security**: Firebase security rules, input sanitization
* **Code Organization**: Clean architecture with separate layers
* **Documentation**: Comprehensive README and inline comments

---

## **Versioning & Changelog**

### **Current Version: v5.0**

* **v1.0** – Week 1: Basic login UI and navigation
* **v2.0** – Week 2: Todo list with SharedPreferences persistence
* **v3.0** – Week 3: Complete Task Management App (add/delete/complete tasks)
* **v4.0** – Week 4: HTTP API integration with JSONPlaceholder
* **v5.0** – Week 5: Firebase Authentication and Firestore integration

### **Features by Version**

#### **v1.0 - Basic UI & Navigation**
- ✅ Login screen with email/password fields
- ✅ Basic form validation
- ✅ Screen navigation with Navigator
- ✅ Material Design components

#### **v2.0 - State Management & Persistence**
- ✅ Task list with add functionality
- ✅ SharedPreferences for local storage
- ✅ Task persistence across app restarts
- ✅ Basic counter app for state management learning

#### **v3.0 - Complete Task Manager**
- ✅ Full CRUD operations (Create, Read, Update, Delete)
- ✅ Task completion with checkbox and strikethrough
- ✅ Custom AppBar with action buttons
- ✅ Dialog-based task creation
- ✅ Improved UI/UX

#### **v4.0 - API Integration**
- ✅ HTTP requests with http package
- ✅ JSON parsing and data models
- ✅ API demo screen with posts list
- ✅ Error handling and loading states
- ✅ Retry functionality
- ✅ User profile from API

#### **v5.0 - Firebase Integration**
- ✅ Email/password authentication
- ✅ User registration and login
- ✅ Cloud Firestore for user profiles
- ✅ Real-time data synchronization
- ✅ Secure authentication flow
- ✅ Profile management and sign out

### **Upcoming Features (Future Versions)**
- 🔄 Push notifications
- 🔄 Social login (Google, Facebook)
- 🔄 Task sharing and collaboration
- 🔄 Offline support with sync
- 🔄 Advanced task categories and tags
- 🔄 Task reminders and due dates

---

## **API Documentation**

### **External APIs Used**

#### **JSONPlaceholder (Week 4)**
- **Base URL**: `https://jsonplaceholder.typicode.com`
- **Endpoints**:
  - `GET /posts` - Retrieve all posts
  - `GET /users` - Retrieve all users
  - `GET /users/{id}` - Retrieve specific user
- **Response Format**: JSON
- **Rate Limiting**: None (for development)

#### **Firebase Services (Week 5)**
- **Authentication**: Email/password auth
- **Firestore**: NoSQL document database
- **Security Rules**: User-specific data access

### **Internal API Structure**

#### **ApiService Class**
```dart
class ApiService {
  Future<List<dynamic>> fetchPosts();
  Future<List<dynamic>> fetchUsers();
  Future<Map<String, dynamic>> fetchUser(int id);
}
```

#### **FirebaseService Class**
```dart
class FirebaseService {
  // Authentication
  Future<UserCredential> signUp(String email, String password);
  Future<UserCredential> signIn(String email, String password);
  Future<void> signOut();
  
  // Firestore
  Future<void> saveUserProfile(String uid, String name, String email);
  Future<Map<String, dynamic>?> getUserProfile(String uid);
  Future<void> createOrUpdateProfile(String uid, Map<String, dynamic> data);
}
```

### **Data Models**

#### **Task Model**
```dart
class Task {
  String title;
  bool isDone;
  
  Task({required this.title, this.isDone = false});
  Map<String, dynamic> toMap();
  factory Task.fromMap(Map<String, dynamic> map);
}
```

#### **User Profile (Firestore)**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "createdAt": "2024-01-01T00:00:00.000Z",
  "updatedAt": "2024-01-01T00:00:00.000Z"
}
```

---

## **Contributing**

### **Development Setup**

1. **Fork the repository**
2. **Clone your fork**:
   ```bash
   git clone https://github.com/your-username/todoapp.git
   cd todoapp
   ```

3. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

4. **Install dependencies**:
   ```bash
   flutter pub get
   ```

5. **Run tests**:
   ```bash
   flutter test
   ```

6. **Make your changes** and test thoroughly

7. **Commit your changes**:
   ```bash
   git commit -am "Add your feature description"
   ```

8. **Push to your branch**:
   ```bash
   git push origin feature/your-feature-name
   ```

9. **Create a Pull Request**

### **Code Style**

- Follow Dart/Flutter best practices
- Use meaningful variable and function names
- Add comments for complex logic
- Write unit tests for new features
- Ensure code passes `flutter analyze`

### **Testing**

- Write unit tests for business logic
- Test UI components on multiple screen sizes
- Test error scenarios and edge cases
- Verify Firebase integration works correctly

### **Reporting Issues**

When reporting bugs, please include:
- Flutter version (`flutter --version`)
- Device/emulator information
- Steps to reproduce
- Expected vs actual behavior
- Screenshots/logs if applicable

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## **Acknowledgments**

* **Flutter Team** - For the amazing framework
* **Firebase** - For backend services
* **JSONPlaceholder** - For API testing
* **Material Design** - For UI inspiration
* **Open Source Community** - For continuous learning

---

## **Contact**

For questions or suggestions:
- **GitHub Issues**: [Report bugs or request features](https://github.com/asrarehman24/todoapp/issues)
- **Email**: [Your contact email]

---

*Last updated: January 4, 2026*
