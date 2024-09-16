import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_test_app/app/di/di.dart';
import 'package:pixabay_test_app/app/domain/bloc/app_store.dart';
import 'package:pixabay_test_app/app/routes/app_router.gr.dart';
import 'package:pixabay_test_app/features/photos/domain/bloc/photos_bloc.dart';
import 'package:pixabay_test_app/features/photos/domain/model/photos_repository.dart';
import 'package:pixabay_test_app/features/photos/presentation/components/photo_item.dart';

@RoutePage()
class PhotosPage extends StatelessWidget implements AutoRouteWrapper {
  const PhotosPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotosBloc(getIt.get<PhotosRepository>())..add(const LoadPhotos()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AppStore>().logout();
              context.router.replaceAll([const LoginRoute()]);
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
      body: BlocBuilder<PhotosBloc, PhotosState>(
        builder: (context, state) {
          switch (state) {
            case PhotosInitial():
            case PhotosInProgress():
              return const Center(child: CircularProgressIndicator());
            case PhotosLoaded():
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 1.15,
                ),
                itemBuilder: (context, index) {
                  final photo = state.photos[index];

                  return PhotoItem(photo);
                },
              );
            case PhotosIsEmpty():
              return const Center(child: Text('No photos found'));
            case PhotosLoadingError():
              return Center(child: Text(state.message));
          }
        },
      ),
    );
  }
}
