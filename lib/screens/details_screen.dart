import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../data/models/photo_model.dart';
import '../widgets/shimmer_placeholder.dart';

class DetailsScreen extends StatelessWidget {
  final PhotoModel? photo;
  const DetailsScreen({super.key, this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: photo!.imageUrl,
            placeholder: (context, url) => const ShimmerPlaceholder(
              width: double.infinity,
              height: 200,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(height: 16),
          Text(photo!.description),
          Text('Likes: ${photo!.likes}'),
        ],
      ),
    );
  }
}
