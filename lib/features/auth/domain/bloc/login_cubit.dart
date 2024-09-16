import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_test_app/app/di/di.dart';
import 'package:pixabay_test_app/app/domain/bloc/app_store.dart';
import 'package:pixabay_test_app/features/auth/data/repository/mock_auth_repository.dart';
import 'package:pixabay_test_app/app/domain/model/app_exception.dart';
import 'package:pixabay_test_app/features/auth/domain/bloc/login_state.dart';
import 'package:pixabay_test_app/features/auth/domain/repository/auth_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repository) : super(const LoginState());

  final AuthRepository repository;

  Future<void> login() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final token = await repository.login(
        email: state.email,
        password: state.password,
      );
      if (token.isNotEmpty) {
        await getIt.get<AppStore>().setToken(token);
        emit(state.copyWith(isSuccessful: true, isLoading: false));
      }
    } on UnauthorizedException catch (_) {
      emit(state.copyWith(errorMessage: 'Incorrect email or password', isLoading: false));
    } on AppException catch (e) {
      emit(state.copyWith(errorMessage: e.message, isLoading: false));
    }
  }

  void setEmail(String value) => emit(
        state.copyWith(
          email: value,
          errorMessage: null,
        ),
      );

  void setPassword(String value) => emit(
        state.copyWith(
          password: value,
          errorMessage: null,
        ),
      );
}
