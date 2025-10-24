import 'package:bloc/bloc.dart';
import 'package:bookia/feature/auth/data/models/register_request_model.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  login({required String email, required String password}) async {
    emit(LoginLodingState());
    final response = await AuthRepo.login(email: email, password: password);

    if (response is String) {
      emit(LoginErrorState(response));
    } else {
      emit(LoginSuccessState());
    }
  }

   register(RegisterRequestModel registerModer) async {
    emit(RegisterLodingState());
    final response = await AuthRepo.register(registerModer);


       if (response is String) {
      emit(RegisterErrorState(response));
    } else {
      emit(RegisterSuccessState());
    }
  }
  
}
