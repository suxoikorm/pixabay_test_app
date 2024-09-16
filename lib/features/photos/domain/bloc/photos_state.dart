part of 'photos_bloc.dart';

sealed class PhotosState extends Equatable {
  const PhotosState();

  @override
  List<Object> get props => [];
}

final class PhotosInitial extends PhotosState {
  const PhotosInitial() : super();
}

final class PhotosInProgress extends PhotosState {
  const PhotosInProgress();
}

final class PhotosIsEmpty extends PhotosState {
  const PhotosIsEmpty();
}

final class PhotosLoadingError extends PhotosState {
  const PhotosLoadingError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class PhotosLoaded extends PhotosState {
  const PhotosLoaded(this.photos);

  final List<PhotoEntity> photos;

  @override
  List<Object> get props => [photos];
}
