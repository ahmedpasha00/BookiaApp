import 'package:bookia/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titel;
  final bool withBackButton;
  const CoustomAppBar({super.key, this.titel, this.withBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: titel != null ? Text(titel!) : null,
        leading:withBackButton? InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.borderColor, width: 2.w),
            ),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.darkColor,
            ),
          ),
        ):null,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56.h);
}
