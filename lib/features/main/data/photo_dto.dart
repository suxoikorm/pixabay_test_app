import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_test_app/features/main/domain/photo_entity.dart';

part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDto {
  const PhotoDto({
    this.id,
    this.previewUrl,
    this.imageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.tags,
    this.type,
    this.userName,
    this.userImageUrl,
    this.viewsCount,
    this.downloadsCount,
    this.likesCount,
    this.commentsCount,
    this.collectionsCount,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) => _$PhotoDtoFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'previewURL')
  final String? previewUrl;
  @JsonKey(name: 'largeImageURL')
  final String? imageUrl;
  @JsonKey(name: 'imageWidth')
  final int? imageWidth;
  @JsonKey(name: 'imageHeight')
  final int? imageHeight;
  @JsonKey(name: 'imageSize')
  final int? imageSize;
  @JsonKey(name: 'tags')
  final String? tags;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'user')
  final String? userName;
  @JsonKey(name: 'userImage')
  final String? userImageUrl;
  @JsonKey(name: 'views')
  final int? viewsCount;
  @JsonKey(name: 'downloads')
  final int? downloadsCount;
  @JsonKey(name: 'likes')
  final int? likesCount;
  @JsonKey(name: 'comments')
  final int? commentsCount;
  @JsonKey(name: 'collections')
  final int? collectionsCount;

  PhotoEntity? toEntity() {
    if (id == null || imageUrl == null || previewUrl == null) return null;

    return PhotoEntity(
      id: id!,
      imageUrl: imageUrl!,
      previewUrl: previewUrl!,
      imageWidth: imageWidth,
      imageHeight: imageHeight,
      imageSize: imageSize,
      tags: tags,
      type: type,
      userName: userName,
      userImageUrl: userImageUrl,
      viewsCount: viewsCount,
      downloadsCount: downloadsCount,
      likesCount: likesCount,
      commentsCount: commentsCount,
      collectionsCount: collectionsCount,
    );
  }
}
