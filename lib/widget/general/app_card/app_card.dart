import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/constans/app_colors.dart';
import 'package:market/core/constans/app_fonts.dart';

class AppCard extends StatelessWidget {
  final String image;
  final String text;
  final String subtitle;
  final double price;
  final double change;
  final String currency;

  const AppCard({
    super.key,
    required this.image,
    required this.text,
    required this.subtitle,
    required this.price,
    required this.change,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.02),
            blurRadius: 20.r,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  image,
                  width: 40.w,
                  height: 40.h,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: 11.w),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "$text\n",
                      style: AppFonts.bodyMedium.copyWith(
                        color: AppColors.black,
                        height: 1,
                      ),
                    ),
                    TextSpan(
                      text: subtitle,
                      style: AppFonts.bodySmall.copyWith(color: AppColors.grey),
                    ),
                  ],
                ),
              ),
              Spacer(),
              ////////
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "$currency ${price.toStringAsFixed(2)}\n",
                      style: AppFonts.bodyMedium.copyWith(
                        color: AppColors.black,
                        height: 1,
                      ),
                    ),
                    TextSpan(
                      text:
                          "${change > 0 ? '+' : ''}${change.toStringAsFixed(2)}%",
                      style: AppFonts.bodySmall.copyWith(
                        color: change < 0 ? AppColors.red : AppColors.green,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
