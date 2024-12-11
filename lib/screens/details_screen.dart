import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../data/models/photo_model.dart';
import '../providers/photo_provider.dart';
import '../widgets/shimmer_placeholder.dart';

class DetailsScreen extends StatelessWidget {
  final PhotoModel? photo;
  const DetailsScreen({super.key, this.photo});

  @override
  Widget build(BuildContext context) {
    final photoProvider = Provider.of<PhotoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Photo Details")),
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
          Text(photo!.description ?? "No description"),
          Text('Likes: ${photo!.likes}'),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)),
          iconSize: 30,
          color: Colors.black,
          icon: Icon(Icons.download),
          onPressed: () {
            if (photo != null) {
              photoProvider.downLoadPhotos(photo!.imageUrl);
            }
          },
        ),
      ),
    );
  }
}
