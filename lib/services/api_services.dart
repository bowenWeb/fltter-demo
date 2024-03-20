import 'package:dio/dio.dart';

class HttpService {
  final Dio _dio = Dio();

  HttpService() {
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (error) {
      throw _handleError(error);
    }
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } catch (error) {
      throw _handleError(error);
    }
  }

  // Add other HTTP methods as needed (e.g., put, delete, etc.)

  dynamic _handleError(error) {
    // Implement your error handling logic here
    print('Dio Error: $error');
    return error;
  }
}
