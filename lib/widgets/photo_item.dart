import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../data/models/photo_model.dart';
import '../screens/details_screen.dart';
import '../widgets/shimmer_placeholder.dart';

class PhotoItem extends StatelessWidget {
  final PhotoModel photo;
  PhotoItem({required this.photo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: photo.imageUrl,
            placeholder: (context, url) => const ShimmerPlaceholder(
              width: double.infinity,
              height: 160,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              photo.description ?? "No description",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(photo: photo),
          ),
        );
      },
    );
  }
}
