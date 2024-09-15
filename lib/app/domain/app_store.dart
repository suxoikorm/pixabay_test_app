import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_test_app/app/domain/app_state.dart';

@Singleton()
class AppStore extends Cubit<AppState> {
  AppStore() : super(const AppState());

  Future<void> init() async {
    emit(const AppState(token: 'token'));
  }
}
