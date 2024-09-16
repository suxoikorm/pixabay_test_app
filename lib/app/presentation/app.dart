import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_test_app/app/di/di.dart';
import 'package:pixabay_test_app/app/domain/bloc/app_store.dart';
import 'package:pixabay_test_app/app/routes/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AppStore>(),
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
