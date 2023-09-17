import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, this.title, required this.errorMessage});
  final String? title;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? 'Error'),
      content: Text(errorMessage),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Ok'),
        )
      ],
    );
  }
}

class DialogUtils {
  static Future<void> showErrorDialog({
    String? title,
    required String errorMessage,
    required BuildContext context,
  }) async {
    return showDialog(
        context: context,
        builder: (_) => ErrorDialog(title: title, errorMessage: errorMessage));
  }
}
