import 'package:flutter/material.dart';
import '../core/app_toast.dart';
import '../data/models/photo_model.dart';
import '../data/repository/photo_repository.dart';

class PhotoProvider with ChangeNotifier {
  final PhotoRepository _repository = PhotoRepository();
  List<PhotoModel> _photos = [];
  bool _isLoading = false;

  List<PhotoModel> get photos => _photos;
  bool get isLoading => _isLoading;

  Future<void> fetchPhotos() async {
    _isLoading = true;
    notifyListeners();

    try {
      _photos = await _repository.fetchPhotos();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> downLoadPhotos(String url) async {
    try {
      bool isDownloaded = await _repository.downloadImage(url);

      if (isDownloaded) {
        AppToast().showSuccessToast("Image downloaded successfully");
      } else {
        AppToast().showErrorToast("Image download failed");
      }
    } catch (e) {
      print(e);
    }
  }
}
