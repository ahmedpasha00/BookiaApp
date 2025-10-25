import 'package:bookia/core/helper/dio_services.dart';
import 'package:bookia/feature/cart/data/models/cart_model.dart';

 class CartRepo {
static getCart() async {
    try {
      final response = await DioServics.dio?.get("/cart");

      if(response?.statusCode == 200){
        return CartModel.fromJson(response?.data);
      }else{
        return "Error";
      }
    } catch (e) {
        return "Error".toString();

    }
  }
}
