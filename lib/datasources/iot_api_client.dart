import 'package:dio/dio.dart';

class IotApiClient with DioMixin implements Dio {
  IotApiClient() {
    options = BaseOptions(
      baseUrl: 'http://34.134.114.158:5000',
      // baseUrl: 'http://127.0.0.1:5000',
      connectTimeout: const Duration(seconds: 5),
      // receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    httpClientAdapter = HttpClientAdapter();
  }
}
