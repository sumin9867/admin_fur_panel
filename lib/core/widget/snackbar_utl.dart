import 'package:flutter/material.dart';

class SnackbarUtil {
  static void showCustomSnackbar(
    BuildContext context, {
    required String message,
    Color textColor = Colors.white,
    Color containerColor = Colors.black54,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: containerColor.withOpacity(1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            message,
            style: TextStyle(color: textColor),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    showCustomSnackbar(
      context,
      message: message,
      textColor: Colors.white,
      containerColor: Colors.green,
    );
  }

  static void showError(BuildContext context, String message) {
    showCustomSnackbar(
      context,
      message: message,
      textColor: Colors.white,
      containerColor: Colors.red,
    );
  }
}
