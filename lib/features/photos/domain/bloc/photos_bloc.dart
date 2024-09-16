import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_test_app/app/domain/model/app_exception.dart';
import 'package:pixabay_test_app/features/photos/domain/model/photo_entity.dart';
import 'package:pixabay_test_app/features/photos/domain/model/photos_repository.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc(this.repository) : super(const PhotosInitial()) {
    on<LoadPhotos>(_onLoadPhotos);
  }

  final PhotosRepository repository;

  Future<void> _onLoadPhotos(LoadPhotos event, Emitter<PhotosState> emit) async {
    emit(const PhotosInProgress());
    try {
      final photos = await repository.getPhotos();
      if (photos.isNotEmpty) {
        emit(PhotosLoaded(photos.toList()));
      } else {
        emit(const PhotosIsEmpty());
      }
    } on AppException catch (e) {
      emit(PhotosLoadingError(e.message));
    }
  }
}
