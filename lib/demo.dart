import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/Custom%20Dialog/smart_dialog.dart';

class DialogDemoScreen extends StatelessWidget {
  const DialogDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Dialog Demo")),
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

          _btn("Confirm Dialog", () async {
            final result = await SmartDialog.confirm(
              context,
              title: "Delete",
              message: "Are you sure?",
            );
            debugPrint("Result: $result");
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
              message: "Operation successful!",
            );
          }),

          _btn("Error Dialog", () {
            SmartDialog.error(
              context,
              message: "Something went wrong!",
            );
          }),

          _btn("Bottom Sheet", () {
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
