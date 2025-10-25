import 'package:bloc/bloc.dart';
import 'package:bookia/feature/cart/data/models/cart_model.dart';
import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  getCart() async {
    emit(GetCartLoding());
    final response = await CartRepo.getCart();
    if (response is String) {
      emit(GetCartError());
    } else if (response is CartModel) {
      emit(GetCartSucsses(response.data?.cartItems ?? []));
    }
  }
}
