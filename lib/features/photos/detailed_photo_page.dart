import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixabay_test_app/features/main/domain/photo_entity.dart';

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
          Flexible(
            child: Container(
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
          ),
          const SizedBox(height: 8),
          if (photo.imageWidth != null && photo.imageHeight != null)
            _PhotoSizeView(
              width: photo.imageWidth!,
              height: photo.imageHeight!,
            ),
          if (photo.type != null)
            _PhotoInfoRow(
              label: 'Type',
              value: photo.type!,
            ),
          if (photo.tags != null)
            _PhotoInfoRow(
              label: 'Tags',
              value: photo.tags!,
            ),
          const Divider(),
          _AuthorView(photo),
          if (photo.viewsCount != null)
            _PhotoInfoRow(
              label: 'Views',
              value: photo.viewsCount.toString(),
            ),
          if (photo.likesCount != null)
            _PhotoInfoRow(
              label: 'Likes',
              value: photo.likesCount.toString(),
            ),
          if (photo.commentsCount != null)
            _PhotoInfoRow(
              label: 'Comments',
              value: photo.commentsCount.toString(),
            ),
          if (photo.collectionsCount != null)
            _PhotoInfoRow(
              label: 'Collections',
              value: photo.collectionsCount.toString(),
            ),
          if (photo.downloadsCount != null)
            _PhotoInfoRow(
              label: 'Downloads',
              value: photo.viewsCount.toString(),
            ),
        ],
      ),
    );
  }
}

class _AuthorView extends StatelessWidget {
  const _AuthorView(this.photo, {super.key});

  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    if (photo.userName != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            if (photo.userImageUrl != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    photo.userImageUrl!,
                  ),
                ),
              ),
            Text(
              photo.userName!,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

class _PhotoSizeView extends StatelessWidget {
  const _PhotoSizeView({
    required this.width,
    required this.height,
    super.key,
  });

  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return _PhotoInfoRow(label: 'Image size', value: '${width}x$height');
  }
}

class _PhotoInfoRow extends StatelessWidget {
  const _PhotoInfoRow({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('$label:'),
            ],
          ),
          const SizedBox(width: 8),
          Flexible(child: Text(value)),
        ],
      ),
    );
  }
}
