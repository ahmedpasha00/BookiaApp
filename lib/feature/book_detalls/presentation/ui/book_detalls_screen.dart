import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/coustom_app_bar.dart';
import 'package:bookia/feature/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetallsScreen extends StatelessWidget {
  final Products product;
  const BookDetallsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(product.image ?? "", width: 183.w, height: 271.h),
            Text(product.name ?? "", style: AppTextStyle.titelLarge),
            Text(
              product.category ?? "",
              style: AppTextStyle.titelSmall.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Text(
                product.description ?? "",
                style: TextStyle(fontSize: (12.sp)),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.price ?? "0", style: AppTextStyle.titelSmall),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.r,
                    vertical: 14.r,
                  ),
                  // width: 73.w,
                  // height: 28.h,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    "Add To Cart",
                    style: AppTextStyle.titelSmallWhigt,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}
