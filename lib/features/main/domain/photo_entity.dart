import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_entity.freezed.dart';

@freezed
class PhotoEntity with _$PhotoEntity {
  const factory PhotoEntity({
    required int id,
    required String imageUrl,
    required String previewUrl,
    int? imageWidth,
    int? imageHeight,
    int? imageSize,
    String? tags,
    String? type,
    String? userName,
    String? userImageUrl,
    int? viewsCount,
    int? downloadsCount,
    int? likesCount,
    int? commentsCount,
    int? collectionsCount,
  }) = _PhotoEntity;
}
