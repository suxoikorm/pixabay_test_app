// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i7;
import 'package:pixabay_test_app/features/auth/login_page.dart' as _i2;
import 'package:pixabay_test_app/features/auth/registration_page.dart' as _i4;
import 'package:pixabay_test_app/features/main/domain/photo_entity.dart' as _i6;
import 'package:pixabay_test_app/features/main/main_page.dart' as _i3;
import 'package:pixabay_test_app/features/photos/detailed_photo_page.dart'
    as _i1;

/// generated route for
/// [_i1.DetailedPhotoPage]
class DetailedPhotoRoute extends _i5.PageRouteInfo<DetailedPhotoRouteArgs> {
  DetailedPhotoRoute({
    required _i6.PhotoEntity photo,
    _i7.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          DetailedPhotoRoute.name,
          args: DetailedPhotoRouteArgs(
            photo: photo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailedPhotoRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailedPhotoRouteArgs>();
      return _i1.DetailedPhotoPage(
        args.photo,
        key: args.key,
      );
    },
  );
}

class DetailedPhotoRouteArgs {
  const DetailedPhotoRouteArgs({
    required this.photo,
    this.key,
  });

  final _i6.PhotoEntity photo;

  final _i7.Key? key;

  @override
  String toString() {
    return 'DetailedPhotoRouteArgs{photo: $photo, key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i3.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.WrappedRoute(child: const _i3.MainPage());
    },
  );
}

/// generated route for
/// [_i4.RegistrationPage]
class RegistrationRoute extends _i5.PageRouteInfo<void> {
  const RegistrationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.RegistrationPage();
    },
  );
}
