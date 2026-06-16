import 'package:dio/dio.dart';
import 'package:tsk_4/src/common/constants/constants.dart';
import 'package:tsk_4/src/common/model/photo_model.dart';

class PhotoService {
  final Dio dio;

  PhotoService({required this.dio});

  Future<dynamic> request(String city) async {
    try {
      final response = await dio.get(
        Constants.photoBaseUrl,
        queryParameters: {
          'input': city,
          'inputtype': 'textquery',
          'fields': 'photos',
          'key': Constants.photoApiKey,
        },
      );
      final candidates = response.data['candidates'] as List?;
      print("candidates: $candidates");
      if (candidates == null || candidates.isEmpty) {
        throw Exception('No results found for "$city"');
      }
      return Landmark.fromJson(candidates[0] as Map<String, dynamic>);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
