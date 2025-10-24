import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/widgets/coustom_app_bar.dart';
import 'package:bookia/core/widgets/coustom_buttom.dart';
import 'package:bookia/core/widgets/coustom_text_form_field.dart';
import 'package:bookia/feature/auth/presentation/ui/register/widgets/register_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 22.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 29.h),
              Text(
                "Hello! Register to get\nstarted",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400),
              ),
              RegisterForm(),
              SizedBox(height: 130.h),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(
                          color: AppColors.darkColor,
                          fontSize: 15.sp,
                        ),
                      ),
                      TextSpan(
                        text: " Login Now",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
