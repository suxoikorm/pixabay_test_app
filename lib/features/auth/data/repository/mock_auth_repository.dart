import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_test_app/app/domain/app_exception.dart';
import 'package:pixabay_test_app/features/auth/domain/model/auth_repository.dart';

@Injectable(as: AuthRepository)
class PixabayPhotosRepository implements AuthRepository {
  @override
  Future<String> login({required String email, required String password}) {
    /// Mock api request to login
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

  /// Mock api request to registration
  @override
  Future<String> registration({
    required String email,
    required String password,
    required int age,
  }) {
    return Future.delayed(const Duration(milliseconds: 500)).then((_) {
      if (email.isNotEmpty && password.isNotEmpty && age >= 18 && age <= 99) {
        return 'fake_user_token';
      }

      throw DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 400,
        ),
      );
    }).catchError((error, trace) {
      if (error is DioException && error.response?.statusCode == 400) {
        throw InvalidRegistrationData('Invalid registration data.');
      }

      if (error is DioException) {
        throw UnknownException('An error occurred while processing the request.');
      }

      throw UnknownException(error.toString());
    });
  }
}

class UnauthorizedException extends AppException {
  UnauthorizedException([super.message = 'User is not authorized.']);
}

class InvalidRegistrationData extends AppException {
  InvalidRegistrationData([super.message = 'Invalid registration data.']);
}
