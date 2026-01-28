# Smart Dialog Pack (Flutter)

A lightweight, flexible, and dependency-free Flutter dialog utility
that provides all commonly used dialog types through a single, clean API.

Includes Alert, Confirmation, Loading, Success, Error, Bottom Sheet, Custom Content dialogs —
perfect for modern Flutter applications.

---

## ✨ Features

🔔 Alert dialog

❓ Confirmation dialog (returns value)

⏳ Loading dialog (blocking UI)

✅ Success dialog with icon

❌ Error dialog with icon

📦 Bottom sheet dialog

🧩 Custom widget dialog

🎬 Smooth Material animations

🎯 Clean static APIs

⚡ Lightweight & reusable

❌ No third-party dependencies — pure Flutter

---

## ✨ Preview






https://github.com/user-attachments/assets/c5531b95-cf6a-476b-8879-aedd58691739




---

## ✨ Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  smart_dialog_pack:
    path: ../smart_dialog_pack

```
▶️ From GitHub
```
dependencies:
  smart_dialog_pack:
    git:
      url: https://github.com/yourusername/smart_dialog_pack.git

```
Then Run:
```
flutter pub get
```
## 📁 Folder Structure
```
smart_dialog_pack/
│
├── lib/
│   └── smart_dialog.dart
│
├── example/
│   └── main.dart
│
└── README.md

  ```
## 🚀 Usage (Demo App)

Below is a complete demo screen showcasing all dialog types
included in Smart Dialog Pack.

```
import 'package:flutter/material.dart';
import 'package:smart_dialog_pack/smart_dialog.dart';

class DialogDemoScreen extends StatelessWidget {
  const DialogDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Smart Dialog Pack")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _btn("Alert Dialog", () {
            SmartDialog.alert(
              context,
              title: "Info",
              message: "This is an alert dialog",
            );
          }),

          _btn("Confirmation Dialog", () async {
            final result = await SmartDialog.confirm(
              context,
              title: "Delete Item",
              message: "Are you sure?",
            );
            debugPrint("User choice: $result");
          }),

          _btn("Loading Dialog", () {
            SmartDialog.loading(context);
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pop(context);
            });
          }),

          _btn("Success Dialog", () {
            SmartDialog.success(
              context,
              message: "Operation completed successfully!",
            );
          }),

          _btn("Error Dialog", () {
            SmartDialog.error(
              context,
              message: "Something went wrong!",
            );
          }),

          _btn("Bottom Sheet Dialog", () {
            SmartDialog.bottomSheet(
              context,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("Bottom Sheet Content"),
                  SizedBox(height: 20),
                ],
              ),
            );
          }),

          _btn("Custom Dialog", () {
            SmartDialog.custom(
              context,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text("Your custom widget here"),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _btn(String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}
```
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
