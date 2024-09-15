import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_test_app/app/di/di.dart';
import 'package:pixabay_test_app/app/domain/app_store.dart';
import 'package:pixabay_test_app/features/auth/data/repository/mock_auth_repository.dart';
import 'package:pixabay_test_app/app/domain/app_exception.dart';
import 'package:pixabay_test_app/features/auth/domain/model/auth_repository.dart';
import 'package:pixabay_test_app/features/auth/domain/model/registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this.repository) : super(const RegistrationState());

  final AuthRepository repository;

  Future<void> registration() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      if (state.age != null) {
        final token = await repository.registration(
          email: state.email,
          password: state.password,
          age: state.age!,
        );
        if (token.isNotEmpty) {
          await getIt.get<AppStore>().setToken(token);
          emit(state.copyWith(isSuccessful: true, isLoading: false));
        }
      }
    } on InvalidRegistrationData catch (_) {
      emit(state.copyWith(errorMessage: 'Incorrect registration data', isLoading: false));
    } on AppException catch (e) {
      emit(state.copyWith(errorMessage: e.message, isLoading: false));
    }
  }

  void setEmail(String value) => emit(state.copyWith(email: value));

  void setPassword(String value) => emit(state.copyWith(password: value));

  void setAge(String value) {
    final age = int.tryParse(value);
    if (age != null) {
      emit(state.copyWith(age: age));
    }
  }
}
