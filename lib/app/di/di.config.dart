// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/main/data/pixabay_photos_repository.dart' as _i694;
import '../../features/main/domain/photos_repository.dart' as _i72;
import '../data/dio_container.dart' as _i227;
import '../domain/app_store.dart' as _i743;

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
  gh.singleton<_i743.AppStore>(() => _i743.AppStore());
  gh.factory<_i72.PhotosRepository>(() => _i694.PixabayPhotosRepository());
  return getIt;
}
