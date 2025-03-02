# 📋 Flutter ToDo App

A simple and minimalistic **ToDo application** built using **Flutter**. This app demonstrates task management using checkboxes, where users can mark tasks as **Completed** or **Incomplete** and add new tasks via a dialog interface.



## 🚀 Features

- ✅ Displays a list of predefined tasks.
- 📝 Allows adding new tasks.
- ✔️ Mark tasks as "Completed" or "Incomplete" with visual changes.
- 📅 Shows the current date dynamically.
- 🎨 Changes text color and adds a strikethrough when tasks are completed.
- 📦 Modular code structure following Flutter best practices.

## 📱 Screenshots

| Home Screen | Add Task Dialog |
|-------------|-----------------|
|![Screenshot_20250302_182248](https://github.com/user-attachments/assets/786d3b48-3f23-4b38-b73d-57f8a60bdfa6)
 | *(Insert screenshot here)* |


## 🛠️ Tech Stack

- **Flutter** (UI toolkit)
- **Dart** (Programming Language)
- **intl** (for date formatting)
- **Material Design** components


## 💡 How it Works

- The app initializes with a predefined list of tasks.
- You can check/uncheck tasks. The UI updates instantly:
  - ✔️ Completed tasks are moved to the bottom with a blue color and strikethrough.
  - ❌ Incomplete tasks are moved to the top with black color and normal text.
- Add a new task via the **"+" button** in the AppBar.


## ⚠️ Known Limitations

- Currently, newly added tasks through the dialog are not saved (the `TextField` input is not yet processed).
- Data is **not persistent**. On restarting the app, tasks reset.
- `db_helper.dart` exists but is not yet integrated with any database.


## 🏗️ Future Improvements

- Capture and store new tasks from the **Add Task** dialog.
- Implement local database support (like **SQLite** or **Hive**).
- Add task categories and deadlines.
- Improve UI responsiveness and animations.


## 🏃 Getting Started

### Prerequisites:
- Flutter SDK installed
- Compatible IDE (like **Android Studio** or **VSCode**)

### Run the App:
```bash
flutter pub get
flutter run
