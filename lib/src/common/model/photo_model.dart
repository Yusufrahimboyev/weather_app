import 'package:tsk_4/src/common/constants/constants.dart';

class Landmark {
  final String? imageUrl;

  Landmark({required this.imageUrl});

  factory Landmark.fromJson(Map<String, dynamic> json) {
    String? imgUrl;
    if (json['photos'] != null && (json['photos'] as List).isNotEmpty) {
      final String? photoReference = json['photos'][0]['photo_reference'];
      imgUrl =
          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=1920&photo_reference=$photoReference&key=${Constants.photoApiKey}';
    }

    return Landmark(imageUrl: imgUrl);
  }
}
