import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:tsk_4/src/common/constants/constants.dart';

enum Method { get, post, put, delete }

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  Future<bool> checkConnection() async {
    final connectivity = await (Connectivity().checkConnectivity());
    if (connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi)) {
      return true;
    }
    return false;
  }

  Future<Map<String, dynamic>> request(String cityName) async {
    if (!await checkConnection()) {
      throw Exception("No Internet Connection");
    }
    try {
      final response = await dio.get(
        Constants.baseUrl,
        queryParameters: {
          'q': cityName,
          'appid': Constants.apiKey,
          'units': 'metric',
        },
      );

      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
