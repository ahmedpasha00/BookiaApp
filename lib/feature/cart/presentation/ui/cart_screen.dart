import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/coustom_app_bar.dart';
import 'package:bookia/core/widgets/coustom_network_image.dart';
import 'package:bookia/feature/cart/presentation/ui/widgets/cart_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBar(titel: "My Cart", withBackButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),

            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => CartBookItem(),
                separatorBuilder: (context, index) => Divider(height: 50.h),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
