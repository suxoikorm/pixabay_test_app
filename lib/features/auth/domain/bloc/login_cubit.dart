import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_test_app/app/di/di.dart';
import 'package:pixabay_test_app/app/domain/app_store.dart';
import 'package:pixabay_test_app/features/auth/data/repository/mock_auth_repository.dart';
import 'package:pixabay_test_app/features/auth/domain/model/auth_repository.dart';
import 'package:pixabay_test_app/features/auth/domain/model/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repository) : super(const LoginState());

  final AuthRepository repository;

  Future<void> login() async {
    emit(state.copyWith(isLoading: true));
    try {
      final token = await repository.login(
        email: state.email,
        password: state.password,
      );
      if (token.isNotEmpty) {
        await getIt.get<AppStore>().setToken(token);
        emit(state.copyWith(isSuccessful: true, isLoading: false));
      }
    } on UnauthorizedException catch (e) {
      log(e.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  void setEmail(String value) => emit(state.copyWith(email: value));

  void setPassword(String value) => emit(state.copyWith(password: value));
}
