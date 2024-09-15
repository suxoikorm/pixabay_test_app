// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoDto _$PhotoDtoFromJson(Map<String, dynamic> json) => PhotoDto(
      id: (json['id'] as num?)?.toInt(),
      previewUrl: json['previewURL'] as String?,
      imageUrl: json['largeImageURL'] as String?,
      imageWidth: (json['imageWidth'] as num?)?.toInt(),
      imageHeight: (json['imageHeight'] as num?)?.toInt(),
      imageSize: (json['imageSize'] as num?)?.toInt(),
      tags: json['tags'] as String?,
      type: json['type'] as String?,
      userName: json['user'] as String?,
      userImageUrl: json['userImage'] as String?,
      viewsCount: (json['views'] as num?)?.toInt(),
      downloadsCount: (json['downloads'] as num?)?.toInt(),
      likesCount: (json['likes'] as num?)?.toInt(),
      commentsCount: (json['comments'] as num?)?.toInt(),
      collectionsCount: (json['collections'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PhotoDtoToJson(PhotoDto instance) => <String, dynamic>{
      'id': instance.id,
      'previewURL': instance.previewUrl,
      'largeImageURL': instance.imageUrl,
      'imageWidth': instance.imageWidth,
      'imageHeight': instance.imageHeight,
      'imageSize': instance.imageSize,
      'tags': instance.tags,
      'type': instance.type,
      'user': instance.userName,
      'userImage': instance.userImageUrl,
      'views': instance.viewsCount,
      'downloads': instance.downloadsCount,
      'likes': instance.likesCount,
      'comments': instance.commentsCount,
      'collections': instance.collectionsCount,
    };
