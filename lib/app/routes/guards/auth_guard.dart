import 'package:auto_route/auto_route.dart';
import 'package:pixabay_test_app/app/di/di.dart';
import 'package:pixabay_test_app/app/domain/app_store.dart';
import 'package:pixabay_test_app/app/routes/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final token = getIt.get<AppStore>().state.token;

    if (token?.isNotEmpty == true) {
      resolver.next();
    } else {
      router.push(const LoginRoute());
    }
  }
}
