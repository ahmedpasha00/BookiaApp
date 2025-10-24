import 'package:bookia/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoustomButtom extends StatelessWidget {
  final String titel;
  final Color? backgroundColor;
  final void Function()? onTap;
  const CoustomButtom({
    super.key,
    required this.titel,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: backgroundColor ?? AppColors.primaryColor,
        ),
        child: Text(
          titel,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: backgroundColor == null ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
