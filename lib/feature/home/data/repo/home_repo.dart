import 'package:bookia/core/helper/dio_services.dart';
import 'package:bookia/feature/home/data/models/product_model.dart';
import 'package:bookia/feature/home/data/models/slider_model.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  static getHomeSlider() async {
    try {
      final response = await DioServics.dio?.get("/sliders");
      if (response?.statusCode == 200) {
        return SliderModel.fromJson(response?.data);
      } else {
        return "Error";
      }
    } catch (error) {
      return error.toString();
    }
  }

  static getBestSelerBooks() async {
    try {
      final response = await DioServics.dio?.get("/products-bestseller");
      if (response?.statusCode == 200) {
        return ProductModel.fromJson(response?.data);
      } else {
        return "Error";
      }
    } catch (e) {
      return "Error";
    }
  }

  static addToCart(int productId ) async {
    try {
      final response = await DioServics.dio?.post("/add-to-cart", data: {
        "product_id": productId,
      });
      if (response?.statusCode == 201
) {
        return response;
      } else {
        return "Error";
      }
    } catch (error) {
      return "Error${error.toString()}";
    }
  }
}
