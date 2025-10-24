import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<String> images = [
  "https://flux1.ai/_next/image?url=https%3A%2F%2Fr2.flux1.ai%2Ffluxai%2F2024%2F08%2Fcar-3.webp&w=3840&q=75",
  "https://cdn.pixabay.com/photo/2018/08/04/11/30/draw-3583548_1280.png",
  "https://media.istockphoto.com/id/500221637/photo/digital-world.jpg?s=612x612&w=0&k=20&c=wbMfTwRUtss0B5KSWRlH-ivSm8BAjMCBUKSi30d6rYo=",
  "https://cdn.pixabay.com/photo/2018/08/04/11/30/draw-3583548_1280.png",
  "https://i0.wp.com/picjumbo.com/wp-content/uploads/beautiful-fall-nature-scenery-free-image.jpeg?w=600&quality=80",

  "https://i0.wp.com/picjumbo.com/wp-content/uploads/beautiful-fall-nature-scenery-free-image.jpeg?w=600&quality=80",
];

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});
  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev,curunt)=> curunt is getHomeSliderSuccess||curunt is getHomeSliderLoading|| curunt is getHomeSliderError,
      builder: (context, state) {
        if (state is getHomeSliderLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is getHomeSliderSuccess) {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 160.0.h,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  autoPlayAnimationDuration: Duration(seconds: 3),
                  autoPlayInterval: Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      activIndex = index;
                    });
                  },
                ),
                items: state.Slider.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0.r),
                          color: Colors.cyan,
                          image: DecorationImage(
                            image: Image.network(i.image ?? "").image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0.h),
              AnimatedSmoothIndicator(
                activeIndex: activIndex,
                count: state.Slider.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.primaryColor,
                  dotHeight: 10.h,
                ),
              ),
            ],
          );
        } else {
          return Text("Error");
        }
      },
    );
  }
}
