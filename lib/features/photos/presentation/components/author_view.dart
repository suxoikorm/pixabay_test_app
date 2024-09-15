import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixabay_test_app/features/photos/domain/model/photo_entity.dart';

class AuthorView extends StatelessWidget {
  const AuthorView(this.photo, {super.key});

  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    if (photo.userName != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Author:'),
            const SizedBox(width: 8),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
                  Flexible(
                    child: Text(
                      photo.userName!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
