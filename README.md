# 📋 Flutter ToDo App

A simple and minimalistic **ToDo application** built using **Flutter**. This app demonstrates basic task management where users can add tasks, mark them as **Completed** or **Incomplete**, and delete tasks. It provides a clean and intuitive interface for managing daily tasks.

## 🚀 Features

- ✅ Displays a predefined list of tasks.
- ➕ Add new tasks with a title and due date.
- ❌ Delete tasks from the list.
- ✔️ Mark tasks as "Completed" or "Incomplete" with visual feedback.
- 📅 Shows the current date dynamically on the home screen.
- 🎨 Visual changes for completed tasks (blue color with strikethrough).
- 📦 Modular code structure following Flutter best practices.

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

- The app starts with a predefined list of tasks.
- You can check/uncheck tasks. The UI updates instantly:
  - ✔️ Completed tasks are moved to the bottom with blue color and strikethrough.
  - ❌ Incomplete tasks are moved to the top with black color and normal text.
  - 🗑️ Delete tasks anytime using the delete icon.
- Add a new task via the **"+" button** in the AppBar.
- Each task shows its **due date**.

## ⚠️ Known Limitations

- Data is **not persistent**. On restarting the app, tasks reset.
- No backend or local database integration (like SQLite or Hive).
- Task lists are handled through multiple parallel arrays which can become difficult to maintain.
- No validation for empty task names or due dates.

## 🏗️ Future Improvements

- Refactor to use a `Task` model for better data handling.
- Implement local storage with **SQLite**, **Hive**, or **SharedPreferences**.
- Add task categories, priorities, and reminders.
- Improve UI responsiveness and add animations.
- Add support for recurring tasks and notifications.
- Implement search and filter functionality.

## 🏃 Getting Started

### Prerequisites:
- Flutter SDK installed
- Compatible IDE (like **Android Studio** or **VSCode**)

### Run the App:
```bash
flutter pub get
flutter run
