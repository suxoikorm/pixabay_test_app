import 'package:pixabay_test_app/features/main/domain/photo_entity.dart';

abstract class PhotosRepository {
  Future<Iterable<PhotoEntity>> getPhotos();
}
