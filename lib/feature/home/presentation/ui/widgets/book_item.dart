import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/feature/home/data/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
 final void Function()? onTap;
 final void Function()? onTapAddToCart;
  final Products? product;
  const BookItem({super.key, required this.product,this.onTap, this.onTapAddToCart});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child: Container(
        padding: EdgeInsets.all(12.r),
        height: 281.h,
        width: 163.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.lighColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190.h,
              width: 140.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: NetworkImage(product?.image ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(product?.name??"", style: AppTextStyle.titelMedium,
            
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product?.price??"0", style: AppTextStyle.titelSmall),
                InkWell(
                  onTap: onTapAddToCart,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 4.r),
                    // width: 73.w,
                    // height: 28.h,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text("Buy", style: AppTextStyle.titelSmallWhigt),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
