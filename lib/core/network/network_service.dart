import 'package:dio/dio.dart';

class NetworkService {
  final Dio _dio;

  NetworkService({Dio? dio}) : _dio = dio ?? Dio();
  Future<T?> get<T>(String url, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return fromJson(response.data as Map<String, dynamic>);
      } else {
        print("error: ${response.statusCode} - ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
