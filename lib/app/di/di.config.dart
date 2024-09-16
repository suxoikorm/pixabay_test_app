// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/repository/mock_auth_repository.dart' as _i207;
import '../../features/auth/domain/model/auth_repository.dart' as _i187;
import '../../features/photos/data/repository/pixabay_photos_repository.dart'
    as _i443;
import '../../features/photos/domain/model/photos_repository.dart' as _i861;
import '../data/dio_container.dart' as _i227;
import '../domain/bloc/app_store.dart' as _i209;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i227.DioContainer>(() => _i227.DioContainer());
  gh.singleton<_i209.AppStore>(() => _i209.AppStore());
  gh.factory<_i861.PhotosRepository>(() => _i443.PixabayPhotosRepository());
  gh.factory<_i187.AuthRepository>(() => _i207.PixabayPhotosRepository());
  return getIt;
}
