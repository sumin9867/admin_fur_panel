import 'package:admin_fur_care/core/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetTitle extends StatelessWidget {
  final String title;
  final String? textButton;
  final VoidCallback? onTap;
  final double? horizontalpadding;
  final double? verticalpadding;

  const WidgetTitle({
    super.key,
    required this.title,
    this.onTap,
    this.textButton,
    this.horizontalpadding,
    this.verticalpadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalpadding ?? 0, vertical: verticalpadding ?? 0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  textButton ?? "",
                  style: const TextStyle(color: AppColor.danger),
                ),
              ),
            ],
          ),
        ]));
  }
}
