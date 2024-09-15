abstract class AuthRepository {
  Future<String> login({
    required String email,
    required String password,
  });

  Future<String> registration({
    required String email,
    required String password,
    required int age,
  });
}
