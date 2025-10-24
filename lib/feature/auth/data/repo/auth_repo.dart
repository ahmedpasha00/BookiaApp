import 'dart:math';

import 'package:bookia/core/helper/dio_services.dart';
import 'package:bookia/core/helper/local_services.dart';
import 'package:bookia/feature/auth/data/models/register_request_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static login({required String email, required String password}) async {
    try {
      final response = await DioServics.dio?.post(
        "/login",
        data: {"email": email, "password": password},
      );
      if (response?.statusCode == 200) {
        debugPrint(
          response?.data["data"]["token"],
        ); //دي مبتظهرش في التطبيق لما بيطلع برودكشن يعني لما التطبيق يبقا جاهز
        await LocalServices.prefs?.setString(
          "userToken",
          response?.data["data"]["token"],
        );
        return response;
      } else {
        log(response?.data["message"]);
        return response?.data["message"];
      }
    } catch (e) {
      return "Error try agin$e";
    }
  }

  static register(RegisterRequestModel registerModel) async {
    try {
      //دي الي بتهندل الايرور

      final response = await DioServics.dio?.post(
        "/register",
        data: registerModel.toMap(),
      );
      if (response?.statusCode == 201) {
        debugPrint(
          response?.data["data"]["token"],
        ); //دي مبتظهرش في التطبيق لما بيطلع برودكشن يعني لما التطبيق يبقا جاهز
        await LocalServices.prefs?.setString(
          "userToken",
          response?.data["data"]["token"],
        );

        return response;
      } else {
        return response?.data["message"];
      }
    } catch (e) {
      return "Error try agin$e";
    }
  }
}
