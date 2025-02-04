import 'package:pixabay_test_app/features/photos/domain/model/photo_entity.dart';

abstract class PhotosRepository {
  Future<Iterable<PhotoEntity>> getPhotos();
}
