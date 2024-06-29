import 'package:dio/dio.dart';

class IotApiClient with DioMixin implements Dio {
  IotApiClient() {
    options = BaseOptions(
      // baseUrl: 'https://opticon.maulanaw.cloud/ml',
      baseUrl: 'http://127.0.0.1:5000',
      connectTimeout: const Duration(seconds: 5),
      // receiveTimeout: const Duration(seconds: 10),
    );

    httpClientAdapter = HttpClientAdapter();
  }
}
