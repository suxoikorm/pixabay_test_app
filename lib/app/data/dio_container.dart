import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_test_app/app/config/config.dart';
import 'package:pixabay_test_app/app/di/di.dart';

@Singleton()
class DioContainer {
  DioContainer() {
    final apiKey = Config.pixabayApiKey;

    final baseOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 7000),
      baseUrl: 'https://pixabay.com/',
      queryParameters: {
        'key': apiKey,
      },
    );

    dio = Dio(baseOptions);
  }

  late final Dio dio;
}

mixin DioProviderMixin {
  Dio get dio => getIt.get<DioContainer>().dio;
}
