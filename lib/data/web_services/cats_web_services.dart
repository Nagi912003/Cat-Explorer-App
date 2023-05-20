import 'package:dio/dio.dart';

import 'package:cats_app/constants/strings.dart';

class CatsWebService {
  late Dio dio;

  CatsWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60), // 60 seconds
      receiveTimeout: const Duration(seconds: 60), // 60 seconds
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCats() async {
    try {
      Response response = await dio.get('/api/cats');
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
