import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/feature/cart/presentation/ui/cart_screen.dart';
import 'package:bookia/feature/favorit/presentation/ui/favorit_screen.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/ui/home_screen.dart';
import 'package:bookia/feature/my_account/presentation/ui/my_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    BlocProvider(create: (context) => HomeCubit()..getHomeSlider()..getBestSeller(), child: HomeScreen()),
    FavoritScreen(),
    CartScreen(),
    MyAccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // fixedColor: AppColors.primaryColor,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primaryColor,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: AppColors.primaryColor),

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Home.svg"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Combined-Shape.svg"),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/card.svg"),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Profile.svg"),
            label: "Profile",
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
