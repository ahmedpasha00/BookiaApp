import 'package:bookia/core/helper/local_services.dart';
import 'package:bookia/core/widgets/coustom_app_bar.dart';
import 'package:bookia/feature/welcome/presentation/ui/welcon_screen.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBar(titel: "Account", withBackButton: false),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            LocalServices.prefs?.remove("userToken");
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => WelconScreen()),
              (e) => false,
            );
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}




    //  ElevatedButton(
    //         onPressed: () {
    //           LocalServices.prefs?.remove("userToken");
    //           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> WelconScreen()), (e)=>false);
    //         },
    //         child: Text("Logout"),
    //       ),