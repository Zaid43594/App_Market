import 'package:flutter/material.dart';
import 'package:market/core/constans/app_colors.dart';

import '../../../core/constans/app_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  final double borderWidth;
  final Color borderColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.primary,
    this.textColor = AppColors.white,
    this.height = 50,
    this.width = double.infinity,
    this.borderWidth = 1,
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: borderColor, width: borderWidth),
          ),
        ),
        child: Text(
          text,
          style: AppFonts.titleMedium.copyWith(color: textColor),
        ),
      ),
    );
  }
}
