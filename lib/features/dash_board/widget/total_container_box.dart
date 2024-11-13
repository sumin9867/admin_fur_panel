import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final String subText;

  const CustomCard({
    super.key,
    required this.color,
    required this.textColor,
    required this.text,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: 24,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.more_vert, color: textColor),
                  ],
                ),
                Text(
                  subText,
                  style: TextStyle(color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
