import 'package:flutter/material.dart';

class VetTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final Function(String value)? onFieldSubmitted;
  final int? maxLength;
  final String labelText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final String? hint;

  const VetTextField({
    super.key,
    required this.controller,
    required this.textInputAction,
    this.onFieldSubmitted,
    required this.labelText,
    this.keyboardType,
    this.maxLength,
    this.validator,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    FormFieldValidator<String>? effectiveValidator =
        validator ?? _defaultValidator;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hint ?? "",
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 174, 173, 173))),
        validator: effectiveValidator,
      ),
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
