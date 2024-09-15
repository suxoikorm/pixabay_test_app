import 'package:flutter/material.dart';
import 'package:pixabay_test_app/app/app.dart';
import 'package:pixabay_test_app/app/di/di.dart';
import 'package:pixabay_test_app/app/domain/app_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt.get<AppStore>().init();
  runApp(App());
}
