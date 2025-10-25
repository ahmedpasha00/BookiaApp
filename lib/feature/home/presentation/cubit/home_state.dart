part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

final class getHomeSliderLoading extends HomeState {}

final class getHomeSliderError extends HomeState {}

final class getHomeSliderSuccess extends HomeState {
  final List<Sliders> Slider;
  getHomeSliderSuccess(this.Slider);
}

final class getBestSelerError extends HomeState {}

final class getBestSelerLoding extends HomeState {}

final class getBestSelerSuccess extends HomeState {
  final List<Products> productsListe;

  getBestSelerSuccess(this.productsListe);
}
final class AddToCartSuccess extends HomeState {}
final class AddToCartLoding extends HomeState {}
final class AddToCartError extends HomeState {}


//دي انا عاملها بجرب بيها لو هاينفع اضيف بيها للفيفوريت اسكرين ولا لا


final class AddToFavoriteSuccess extends HomeState {}
final class AddToFavoriteLoding extends HomeState {}
final class AddToFavoriteError extends HomeState {}