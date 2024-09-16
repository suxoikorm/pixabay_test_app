part of 'photos_bloc.dart';

sealed class PhotosEvent {
  const PhotosEvent();
}

final class LoadPhotos extends PhotosEvent {
  const LoadPhotos();
}
