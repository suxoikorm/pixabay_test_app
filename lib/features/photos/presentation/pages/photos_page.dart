import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_test_app/app/di/di.dart';
import 'package:pixabay_test_app/app/domain/app_store.dart';
import 'package:pixabay_test_app/app/routes/app_router.gr.dart';
import 'package:pixabay_test_app/features/photos/domain/photos_cubit.dart';
import 'package:pixabay_test_app/features/photos/domain/photos_repository.dart';
import 'package:pixabay_test_app/features/photos/domain/photos_state.dart';
import 'package:pixabay_test_app/features/photos/presentation/components/photo_item.dart';

@RoutePage()
class PhotosPage extends StatelessWidget implements AutoRouteWrapper {
  const PhotosPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotosCubit(getIt.get<PhotosRepository>())..init(),
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
      body: BlocBuilder<PhotosCubit, PhotosState>(
        builder: (context, state) {
          final photos = state.photos;

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (photos.isNotEmpty) {
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.15,
              ),
              itemBuilder: (context, index) {
                final photo = photos[index];

                return PhotoItem(photo);
              },
            );
          }

          return const Center(child: Text('No photos found'));
        },
      ),
    );
  }
}
