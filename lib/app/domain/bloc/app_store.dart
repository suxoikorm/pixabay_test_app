import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_test_app/app/domain/bloc/app_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kTokenKey = 'token';

@Singleton()
class AppStore extends Cubit<AppState> {
  AppStore() : super(const AppState());

  late SharedPreferencesWithCache prefs;

  Future<void> init() async {
    prefs = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
    final token = prefs.getString(kTokenKey);

    if (token?.isNotEmpty == true) {
      emit(state.copyWith(token: 'token'));
    }
  }

  Future<void> logout() async {
    await _writeToken(null);
    emit(state.copyWith(token: null));
  }

  Future<void> setToken(String token) async {
    await _writeToken(token);
    emit(state.copyWith(token: token));
  }

  Future<void> _writeToken(String? token) async {
    if (token?.isNotEmpty == true) {
      await prefs.setString(kTokenKey, token!);
    } else {
      await prefs.remove(kTokenKey);
    }
  }
}
