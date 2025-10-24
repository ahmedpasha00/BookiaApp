import 'package:bookia/bookia.dart';
import 'package:bookia/core/helper/dio_services.dart';
import 'package:bookia/core/helper/local_services.dart';
import 'package:flutter/material.dart';

void main() async {
  // ScrreenUtil.ensureScreenSize(); دي لو انا مستخدم اسكرين يوتيل علشان تظهرلي الكلام الي موجود في الصفحات
  //ده بيقول الي اي حاجه اويت في ال main اتكد الي هيا خلصت وبعد كده رن التطبيق عادي
  WidgetsFlutterBinding.ensureInitialized();
  await LocalServices.init();
  DioServics.init(); //دي علشان اعرفها في اول التطبيق علشان استخدمها علي طزل من غير م افضل اعمله كل مره
  runApp(const Bookia());
}
