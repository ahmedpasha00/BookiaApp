import 'package:bookia/core/helper/local_services.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/feature/book_detalls/presentation/ui/book_detalls_screen.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/ui/widgets/book_item.dart';
import 'package:bookia/feature/home/presentation/ui/widgets/home_app_bar.dart';
import 'package:bookia/feature/home/presentation/ui/widgets/home_slider.dart';
import 'package:bookia/feature/welcome/presentation/ui/welcon_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Column(
            spacing: 15.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              HomeSlider(),
              Text("Best Seller", style: AppTextStyle.titelLarge),
              Expanded(
                child: BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {
                    if (state is AddToCartLoding) {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is AddToCartSuccess) {
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Added to cart successfully"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                    if (state is AddToFavoriteLoding) {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is AddToFavoriteSuccess) {
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Added to Favorite successfully"),
                          backgroundColor: AppColors.primaryColor,
                        ),
                      );
                    }
                  },
                  buildWhen: (prev, curunet) =>
                      curunet is getBestSelerError ||
                      curunet is getBestSelerLoding ||
                      curunet is getBestSelerSuccess,
                  builder: (context, state) {
                    if (state is getBestSelerLoding) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is getBestSelerSuccess) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .47,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),

                        itemBuilder: (context, index) => BookItem(
                          product: state.productsListe[index],

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookDetallsScreen(
                                  product: state.productsListe[index],
                                ),
                              ),
                            );
                          },
                          onTapAddToCart: () {
                            context.read<HomeCubit>().addToCart(
                              state.productsListe[index].id ?? 0,
                            );
                          },

                          onTapAddToFaavorit: () {
                            context.read<HomeCubit>().addToFavorite(
                              state.productsListe[index].id ?? 0,
                            );
                          },
                        ),
                        itemCount: state.productsListe.length,
                      );
                    } else {
                      return Text("Error");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






















       // ElevatedButton(
          //   onPressed: () {
          //     LocalServices.prefs?.remove("userToken");
          //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> WelconScreen()), (e)=>false);
          //   },
          //   child: Text("Logout"),
          // ),