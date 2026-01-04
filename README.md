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

## **Setup Instructions**

### **Prerequisites**

* Flutter SDK installed: [Flutter Install Guide](https://docs.flutter.dev/get-started/install)
*  VS Code
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

---

## **Notes**

* Week 1 focuses on **UI and navigation**.
* Week 2 focuses on **state management** and **persistent storage**.
* Week 3 combines **all concepts** into a functional **Task Management App**.
* Week 4 adds **HTTP requests** and **API integration** with error handling.
* SharedPreferences is used for data persistence in Week 2 and 3 apps.

---

## **Versioning**

* **v1.0** – Week 1: Login app
* **v2.0** – Week 2: Todo list with persistence
* **v3.0** – Week 3: Final Task Management App with add/delete/complete
* **v4.0** – Week 4: HTTP requests and API integration

---
