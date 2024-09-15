import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_test_app/features/auth/domain/model/auth_repository.dart';

@Injectable(as: AuthRepository)
class PixabayPhotosRepository implements AuthRepository {
  @override
  Future<String> login({required String email, required String password}) {
    return Future.delayed(const Duration(milliseconds: 500), () {
      if (email == 'email@email.com' && password == 'password') {
        return 'fake_user_token';
      }

      throw DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 401,
        ),
      );
    }).then(
      (token) {
        return token;
      },
    ).catchError((error, trace) {
      if (error is DioException && error.response?.statusCode == 401) {
        throw UnauthorizedException();
      }

      if (error is DioException) {
        throw UnknownException('An error occurred while processing the request.');
      }

      throw UnknownException(error.toString());
    });
  }

  @override
  Future<String> registration({required String email, required String password}) {
    return Future.delayed(const Duration(milliseconds: 500)).then(
      (_) {
        if (email.isNotEmpty && password.isNotEmpty) {
          return 'fake_user_token';
        }

        throw DioException(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 401,
          ),
        );
      },
    );
  }
}

class UnauthorizedException implements Exception {
  UnauthorizedException([this.message = 'User is not authorized.']);
  final String message;
}

class UnknownException implements Exception {
  UnknownException([this.message = 'An unknown error occurred.']);
  final String message;
}
