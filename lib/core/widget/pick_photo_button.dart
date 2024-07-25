import 'package:admin_fur_care/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class TakePhotoButton extends StatelessWidget {
  final VoidCallback onPressed;

  const TakePhotoButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .2,
        vertical: MediaQuery.of(context).size.height * .01,
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.camera_alt, size: 24.0),
        label: const Text('Take Photo'),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          textStyle: const TextStyle(fontSize: 16.0),
          backgroundColor: AppColor.button2, // Set the text color to white
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
