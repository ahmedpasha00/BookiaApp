import 'package:bloc/bloc.dart';
import 'package:bookia/feature/home/data/models/product_model.dart';
import 'package:bookia/feature/home/data/models/slider_model.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getHomeSlider() async {
    emit(getHomeSliderLoading());
    final response = await HomeRepo.getHomeSlider();
    if (response is String) {
      emit(getHomeSliderError());
    } else if (response is SliderModel) {
      emit(getHomeSliderSuccess(response.data?.sliders ?? []));
    }
  }

  getBestSeller() async {
    emit(getBestSelerLoding());
    final response = await HomeRepo.getBestSelerBooks();
    if (response is String) {
      emit(getBestSelerError());
    } else if (response is ProductModel) {
      emit(getBestSelerSuccess(response.data?.products ?? []));
    }
  }

  addToCart(int productId) async {
    emit(AddToCartLoding());
    final response = await HomeRepo.addToCart(productId);

    if (response is String) {
      emit(AddToCartError());
    } else {
      emit(AddToCartSuccess());
    }
  }
}
