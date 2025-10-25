import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/coustom_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBookItem extends StatelessWidget {
  const CartBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoustomNetworkImage(
          imageUrl:
              "https://cdn.pixabay.com/photo/2018/08/04/11/30/draw-3583548_1280.png",
          width: 100.w,
          height: 118.h,
          radius: 12.r,
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("The Republic", style: AppTextStyle.titelMedium),
              SizedBox(height: 9.h),

              Text("₹285", style: AppTextStyle.titelSmall),
              SizedBox(height: 29.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: AppColors.lightGrayColor,
                    ),
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 10.w),

                  Text("010", style: AppTextStyle.titelMedium),
                  SizedBox(width: 10.w),

                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: AppColors.lightGrayColor,
                    ),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2.w),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.close),
        ),
      ],
    );
  }
}
