import 'package:flutter/material.dart';

class StatusProperties {
  final IconData icon;
  final Color color;
  final String text;

  StatusProperties({
    required this.icon,
    required this.color,
    required this.text,
  });

  static StatusProperties fromStatus(String status) {
    switch (status) {
      case 'Approved':
        return StatusProperties(
          icon: Icons.check_circle,
          color: Colors.green,
          text: 'Approved',
        );
      case 'Rejected':
        return StatusProperties(
          icon: Icons.cancel,
          color: Colors.red,
          text: 'Rejected',
        );
      case 'Awaiting':
      default:
        return StatusProperties(
          icon: Icons.hourglass_empty,
          color: Colors.orange,
          text: 'Awaiting',
        );
    }
  }
}
