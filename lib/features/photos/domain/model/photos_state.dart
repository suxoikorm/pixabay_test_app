import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_test_app/features/photos/domain/model/photo_entity.dart';

part 'photos_state.freezed.dart';

@freezed
class PhotosState with _$PhotosState {
  const factory PhotosState({
    @Default(false) bool isLoading,
    @Default([]) List<PhotoEntity> photos,
  }) = _PhotosState;
}
