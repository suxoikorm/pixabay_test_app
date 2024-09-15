import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_test_app/features/main/domain/photos_repository.dart';
import 'package:pixabay_test_app/features/main/domain/photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit(this.repository) : super(const PhotosState());

  final PhotosRepository repository;

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    final photos = await repository.getPhotos();
    emit(state.copyWith(isLoading: false, photos: photos.toList()));
  }
}
