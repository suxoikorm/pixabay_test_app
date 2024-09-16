import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const AppState._();
  const factory AppState({
    String? token,
  }) = _AppState;

  bool get isUserAuthorized => token != null;
}
