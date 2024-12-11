import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo_model.dart';
import '../../core/app_constants.dart';

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
}
