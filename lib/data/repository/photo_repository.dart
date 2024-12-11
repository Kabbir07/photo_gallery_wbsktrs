import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo_model.dart';
import '../../core/app_constants.dart';
import 'dart:io';

class PhotoRepository {
  Future<List<PhotoModel>> fetchPhotos() async {
    final response = await http.get(
      Uri.parse(AppConstants.baseUrl),
      headers: {
        'Authorization': 'Client-ID ${AppConstants.apiKey}',
      },
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => PhotoModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }

  Future<bool> downloadImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        final directory = Directory('/storage/emulated/0/Download');
        if (!(await directory.exists())) {
          await directory.create(recursive: true);
        }

        final filePath =
            "${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg";

        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        // AppToast().showSuccessToast("Image saved to: $filePath");

        return true;
      } else {
        // AppToast()
        //     .showErrorToast("Failed to download image: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      // AppToast().showErrorToast("Error downloading image: $e");
      return false;
    }
  }
}
