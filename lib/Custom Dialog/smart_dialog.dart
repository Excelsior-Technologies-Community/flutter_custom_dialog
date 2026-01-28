import 'package:flutter/material.dart';

class SmartDialog {
  /// 🔔 1. ALERT DIALOG
  static Future<void> alert(
      BuildContext context, {
        required String title,
        required String message,
      }) {
    return showDialog(
      context: context,
      builder: (_) => _baseDialog(
        title: title,
        message: message,
        actions: [
          _actionButton("OK", () => Navigator.pop(context)),
        ],
      ),
    );
  }

  /// ❓ 2. CONFIRMATION DIALOG (returns bool)
  static Future<bool?> confirm(
      BuildContext context, {
        required String title,
        required String message,
      }) {
    return showDialog<bool>(
      context: context,
      builder: (_) => _baseDialog(
        title: title,
        message: message,
        actions: [
          _actionButton("No", () => Navigator.pop(context, false)),
          _actionButton("Yes", () => Navigator.pop(context, true)),
        ],
      ),
    );
  }

  /// ⏳ 3. LOADING DIALOG
  static void loading(BuildContext context, {String text = "Loading..."}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ✅ 4. SUCCESS DIALOG
  static void success(
      BuildContext context, {
        required String message,
      }) {
    _iconDialog(
      context,
      icon: Icons.check_circle,
      color: Colors.green,
      message: message,
    );
  }

  /// ❌ 5. ERROR DIALOG
  static void error(
      BuildContext context, {
        required String message,
      }) {
    _iconDialog(
      context,
      icon: Icons.error,
      color: Colors.red,
      message: message,
    );
  }

  /// 📦 6. BOTTOM SHEET DIALOG
  static void bottomSheet(
      BuildContext context, {
        required Widget child,
      }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }

  /// 🧩 7. CUSTOM CONTENT DIALOG
  static void custom(
      BuildContext context, {
        required Widget child,
      }) {
    showDialog(
      context: context,
      builder: (_) => Center(
        child: Material(
          color: Colors.transparent,
          child: child,
        ),
      ),
    );
  }

  /// 🧱 BASE DIALOG UI
  static Widget _baseDialog({
    required String title,
    required String message,
    required List<Widget> actions,
  }) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(title),
      content: Text(message),
      actions: actions,
    );
  }

  /// 🔘 BUTTON
  static Widget _actionButton(String text, VoidCallback onTap) {
    return TextButton(onPressed: onTap, child: Text(text));
  }

  /// 🎯 ICON DIALOG
  static void _iconDialog(
      BuildContext context, {
        required IconData icon,
        required Color color,
        required String message,
      }) {
    showDialog(
      context: context,
      builder: (_) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: color, size: 60),
                const SizedBox(height: 16),
                Text(message, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
