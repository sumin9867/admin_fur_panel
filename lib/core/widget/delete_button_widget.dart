import 'package:flutter/material.dart';

class DeleteButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const DeleteButtonWidget({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.delete, size: 16.0),
      label: const Text('Delete'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
        textStyle: const TextStyle(fontSize: 16.0),
        backgroundColor: Colors.red, // Set the background color to red
        foregroundColor: Colors.white, // Set the text color to white
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
