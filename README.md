# 📋 Flutter ToDo App

A simple and minimalistic **ToDo application** built using **Flutter**. This app allows users to manage their daily tasks by adding, completing, and deleting tasks with a smooth and intuitive interface.

## 🚀 Features

- ✅ Displays a list of tasks with due dates.
- 📝 Allows adding new tasks with a title and due date.
- ✔️ Mark tasks as "Completed" or "Incomplete" with visual changes.
- 📅 Shows the current date dynamically.
- 🗑️ Delete tasks with a single tap.
- 🎨 Changes text color and adds a strikethrough when tasks are completed.
- 📦 Modular code structure following Flutter best practices.

## 📂 Project Structure

```plaintext
/lib
├── main.dart       # Main UI and app logic
├── Task.dart       # Task model class
```



## 📱 Screenshots

| Home Screen | Add Task Dialog |
|-------------|-----------------|
|<img src="Screenshot_20250303_182948.png" width="200"/>|<img src="Screenshot_20250303_183001.png" width="200"/>|

## 🛠️ Tech Stack

- **Flutter** (UI toolkit)
- **Dart** (Programming Language)
- **intl** (for date formatting)
- **Material Design** components

## 💡 How it Works

- The app initializes with an empty list of tasks.
- You can check/uncheck tasks. The UI updates instantly:
  - ✔️ Completed tasks move to the bottom with a blue color and strikethrough.
  - ❌ Incomplete tasks stay on top with black color and normal text.
- Add a new task using the **"+" button** in the AppBar.
- Delete any task with the trash icon.

## ⚠️ Known Limitations

- Data is **not persistent**. Tasks are lost on app restart.
- No backend or local storage is implemented.

## 🏗️ Future Improvements

- Implement local database support (like **SQLite** or **Hive**).
- Add task categories and deadlines.
- Improve UI responsiveness and animations.
- Add notifications for upcoming tasks.

## 🏃 Getting Started

### Prerequisites:
- Flutter SDK installed
- Compatible IDE (like **Android Studio** or **VSCode**)

### Run the App:
```bash
flutter pub get
flutter run
```

## 📬 Contact
- 📧 Email: pranjalgarg2005@gmail.com
- 💼 LinkedIn: https://www.linkedin.com/in/pranjal-garg-9158a0229/
- 🐙 GitHub: https://github.com/pranjal-garg
