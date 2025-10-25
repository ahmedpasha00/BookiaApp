import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/coustom_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteBookItem extends StatelessWidget {
  const FavoriteBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 300.w,
          height: 132.h,
          decoration: BoxDecoration(
            color: AppColors.lighColor,
            borderRadius: BorderRadius.circular(3.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                      SizedBox(height: 25.h),
                      Text(
                        "Loremeusmod tempor incididunt ut labore et dolore",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 38.w,
            height: 132.h,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(3.r),
            ),

            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2.w),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close),
            ),
          ),
        ),
      ],
    );
  }
}
