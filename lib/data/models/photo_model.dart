class PhotoModel {
  final String id;
  final String imageUrl;
  final String description;
  final int likes;

  PhotoModel({
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.likes,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      imageUrl: json['urls']['small'],
      description: json['description'] ?? 'No Description',
      likes: json['likes'],
    );
  }
}
