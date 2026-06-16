import 'package:tsk_4/src/common/model/photo_model.dart';
import 'package:tsk_4/src/common/service/photo_service.dart';

abstract class IPhotoRepository {
  Future<Landmark> getPhoto(String city);
}

class PhotoRepositoryImpl implements IPhotoRepository {
  final PhotoService photoService;
  PhotoRepositoryImpl({required this.photoService});
  @override
  Future<Landmark> getPhoto(String city) async {
    final response = await photoService.request(city);

    return response;
  }
}
