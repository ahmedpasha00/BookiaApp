part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}


final class GetCartSucsses extends CartState {
final List<CartItems> cartProuduts;

  GetCartSucsses(this.cartProuduts);
}
final class GetCartLoding extends CartState {}
final class GetCartError extends CartState {}

