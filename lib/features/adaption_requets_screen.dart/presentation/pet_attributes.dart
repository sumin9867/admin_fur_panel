import 'package:admin_fur_care/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class PetAttribute extends StatelessWidget {
  final IconData icon;
  final String label;
  final String attribute;

  const PetAttribute({
    super.key,
    required this.icon,
    required this.label,
    required this.attribute,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: AppColor.icon,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          attribute,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
