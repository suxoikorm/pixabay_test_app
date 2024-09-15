import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixabay_test_app/features/photos/domain/photo_entity.dart';
import 'package:pixabay_test_app/features/photos/presentation/components/author_view.dart';
import 'package:pixabay_test_app/features/photos/presentation/components/photo_info_row.dart';
import 'package:pixabay_test_app/features/photos/presentation/components/photo_size_view.dart';

@RoutePage()
class DetailedPhotoPage extends StatelessWidget {
  const DetailedPhotoPage(this.photo, {super.key});

  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              imageUrl: photo.imageUrl,
              placeholder: (context, url) {
                return const Padding(
                  padding: EdgeInsets.all(32),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          if (photo.imageWidth != null && photo.imageHeight != null)
            PhotoSizeView(
              width: photo.imageWidth!,
              height: photo.imageHeight!,
            ),
          if (photo.type != null)
            PhotoInfoRow(
              label: 'Type',
              value: photo.type!,
            ),
          if (photo.tags != null)
            PhotoInfoRow(
              label: 'Tags',
              value: photo.tags!,
            ),
          const Divider(),
          AuthorView(photo),
          if (photo.viewsCount != null)
            PhotoInfoRow(
              label: 'Views',
              value: photo.viewsCount.toString(),
            ),
          if (photo.likesCount != null)
            PhotoInfoRow(
              label: 'Likes',
              value: photo.likesCount.toString(),
            ),
          if (photo.commentsCount != null)
            PhotoInfoRow(
              label: 'Comments',
              value: photo.commentsCount.toString(),
            ),
          if (photo.collectionsCount != null)
            PhotoInfoRow(
              label: 'Collections',
              value: photo.collectionsCount.toString(),
            ),
          if (photo.downloadsCount != null)
            PhotoInfoRow(
              label: 'Downloads',
              value: photo.viewsCount.toString(),
            ),
        ],
      ),
    );
  }
}
