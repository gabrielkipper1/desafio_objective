import 'package:desafio_objective/src/repositories/http_client/http_repository.dart';
import 'package:dio/dio.dart';

class DioHttp implements HttpRepository<Interceptor> {
  final Dio client = Dio();

  DioHttp({List<Interceptor>? interceptors}) {
    if (interceptors != null) {
      for (var interceptor in interceptors) {
        registerInterceptor(interceptor);
      }
    }
  }

  @override
  void registerInterceptor(Interceptor interceptor) {
    client.interceptors.add(interceptor);
  }

  @override
  Future get(String url, {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) {
    return client.get(url, queryParameters: queryParameters, options: Options(headers: headers));
  }
}
