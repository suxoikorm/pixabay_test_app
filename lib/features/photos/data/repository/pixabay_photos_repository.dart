import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_test_app/app/data/dio_container.dart';
import 'package:pixabay_test_app/app/domain/app_exception.dart';
import 'package:pixabay_test_app/features/photos/data/model/photo_dto.dart';
import 'package:pixabay_test_app/features/photos/domain/model/photo_entity.dart';
import 'package:pixabay_test_app/features/photos/domain/model/photos_repository.dart';

@Injectable(as: PhotosRepository)
class PixabayPhotosRepository with DioProviderMixin implements PhotosRepository {
  @override
  Future<Iterable<PhotoEntity>> getPhotos() async {
    const String path = 'api/';
    const String searchQuery = 'orange+flower';

    try {
      final response = await dio.get(
        path,
        queryParameters: {
          'q': searchQuery,
        },
      );

      final data = response.data;
      if (data == null || data['hits'] == null) {
        throw DataParsingException('No data found in response.');
      }

      final hits = data['hits'];
      if (hits is! List<dynamic>) {
        throw DataParsingException('Invalid data format: "hits" is not a list.');
      }

      return hits.map((e) => PhotoDto.fromJson(e).toEntity()).whereNotNull();
    } on DioException catch (_) {
      throw NetworkException();
    } catch (error) {
      throw UnknownException(error.toString());
    }
  }
}

class NetworkException extends AppException {
  NetworkException([super.message = 'Network error occurred']);
}

class DataParsingException extends AppException {
  DataParsingException([super.message = 'Error parsing data']);
}
