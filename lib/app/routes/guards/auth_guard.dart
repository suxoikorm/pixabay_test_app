// import 'package:auto_route/auto_route.dart';
// import 'package:color_auth/color_auth.dart';
// import 'package:purple_diary/app/di/di.dart';
// import 'package:purple_diary/app/domain/bloc/app_store.dart';
// import 'package:purple_diary/app/routes/mobile/app_router.dart';

// class AuthGuard extends AutoRouteGuard {
//   AuthGuard();

//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     final AppUser user = getIt.get<AppStore>().fetchUser();

//     if (user.isNotEmpty == true) {
//       resolver.next();
//     } else {
//       router.push(const LoginRoute());
//     }
//   }
// }
