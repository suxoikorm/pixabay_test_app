import 'package:auto_route/auto_route.dart';
import 'package:pixabay_test_app/app/routes/app_router.gr.dart';
import 'package:pixabay_test_app/app/routes/guards/auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/main',
          page: PhotosRoute.page,
          guards: [
            AuthGuard(),
          ],
        ),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/registration', page: RegistrationRoute.page),
        AutoRoute(path: '/photo', page: DetailedPhotoRoute.page),
      ];
}
