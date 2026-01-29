import 'package:dio/dio.dart';
import 'package:heros/core/network/http_client.dart';

class DioHttpClient implements HttpClient {
  final Dio dio;

  DioHttpClient(this.dio);

  @override
  Future<Map<String, dynamic>> get(String path) async {
    final response = await dio.get(path);
    return response.data;
  }
}
