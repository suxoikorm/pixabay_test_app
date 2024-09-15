import 'package:flutter/material.dart';
import 'package:pixabay_test_app/features/photos/presentation/components/photo_info_row.dart';

class PhotoSizeView extends StatelessWidget {
  const PhotoSizeView({
    required this.width,
    required this.height,
    super.key,
  });

  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return PhotoInfoRow(label: 'Image size', value: '${width}x$height');
  }
}
