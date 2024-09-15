import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_test_app/app/data/dio_container.dart';
import 'package:pixabay_test_app/features/main/data/photo_dto.dart';
import 'package:pixabay_test_app/features/main/domain/photo_entity.dart';
import 'package:pixabay_test_app/features/main/domain/photos_repository.dart';

@Injectable(as: PhotosRepository)
class PixabayPhotosRepository with DioProviderMixin implements PhotosRepository {
  @override
  Future<Iterable<PhotoEntity>> getPhotos() async {
    const String path = 'api/';
    const String searchQuery = 'orange+flower';

    return dio.get(
      path,
      queryParameters: {
        'q': searchQuery,
      },
    ).then(
      (value) => (value.data['hits'] as List<dynamic>)
          .map((e) => PhotoDto.fromJson(e).toEntity())
          .whereNotNull(),
    );
  }
}
