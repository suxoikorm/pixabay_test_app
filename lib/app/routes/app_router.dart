import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

final appRouter = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/',
          page: MainRoute.page,
          guards: const [
            //AuthGuard(),
          ],
        ),
        // AutoRoute(path: '/login', page: LoginRoute.page),
        // AutoRoute(path: '/registration', page: SearchRoute.page),
      ];
}
