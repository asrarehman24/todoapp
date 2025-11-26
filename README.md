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

## **Setup Instructions**

### **Prerequisites**

* Flutter SDK installed: [Flutter Install Guide](https://docs.flutter.dev/get-started/install)
* Android Studio / VS Code
* Git (for version control)

### **Clone the Repository**

```bash
git clone https://github.com/asrarehman24/todoapp.git
cd todoapp
```

### **Install Dependencies**

```bash
flutter pub get
```

### **Run the App**

* For Android:

```bash
flutter run
```

* For Web:

```bash
flutter run -d chrome
```

* For Windows (Desktop):

```bash
flutter run -d windows
```

---

## **Project Structure**

```
lib/
├─ main.dart
├─ screens/
│  ├─ login_screen.dart
│  ├─ home_screen.dart
│  └─ todo_screen.dart
└─ models/
   └─ task.dart
```

---

## **Notes**

* Week 1 focuses on **UI and navigation**.
* Week 2 focuses on **state management** and **persistent storage**.
* Week 3 combines **all concepts** into a functional **Task Management App**.
* SharedPreferences is used for data persistence in Week 2 and 3 apps.

---

## **Versioning**

* **v1.0** – Week 1: Login app
* **v2.0** – Week 2: Todo list with persistence
* **v3.0** – Week 3: Final Task Management App with add/delete/complete

---

This README gives a clear overview of all three weeks and guides someone to **run the project locally**.

---

If you want, I can also **add sample commands for Git tagging each week** so your repo is fully versioned and professional.

Do you want me to do that?
