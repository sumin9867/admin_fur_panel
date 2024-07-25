import 'package:admin_fur_care/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String textHeading;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextStyle? inputTextStyle;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.textHeading,
    required this.hintText,
    this.validator,
    this.inputTextStyle,
    required this.controller, // New parameter for input text style
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textHeading,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Adjust color as needed
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey, // Hint text color
            ),
            filled: true, // Set background color of the input field
            // Background color of the input field
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.grey, // Border color
                width: 1.0,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.grey, // Enabled border color
                width: 1.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: AppColor.primary, // Focused border color
                width: 2.0,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.red, // Error border color
                width: 1.0,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.red, // Focused error border color
                width: 2.0,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            // Padding inside the input field
          ),
          style: inputTextStyle ??
              const TextStyle(
                  color: Colors.black), // Default input text color is black
          validator: validator,
        ),
      ],
    );
  }
}
