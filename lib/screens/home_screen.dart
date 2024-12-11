import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/photo_provider.dart';
import '../widgets/photo_item.dart';
import '../widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _refreshPhotos() async {
    final photoProvider = Provider.of<PhotoProvider>(context, listen: false);
    await photoProvider.fetchPhotos();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshPhotos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final photoProvider = Provider.of<PhotoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Photo Gallery')),
      body: RefreshIndicator(
        onRefresh: _refreshPhotos,
        child: photoProvider.isLoading
            ? LoadingWidget()
            : ListView.builder(
                itemCount: photoProvider.photos.length,
                itemBuilder: (context, index) {
                  return PhotoItem(photo: photoProvider.photos[index]);
                },
              ),
      ),
    );
  }
}
