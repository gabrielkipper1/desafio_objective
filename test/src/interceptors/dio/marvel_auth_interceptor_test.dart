import 'package:desafio_objective/src/interceptors/dio/marvel_auth_interceptor_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  group("Marvel Auth Interceptor Dio", () {
    test("Should add query parameters to request", () async {
      final options = RequestOptions(path: "test");
      final interceptor = MarvelAuthInterceptorDio();
      interceptor.onRequest(options, RequestInterceptorHandler());
      expect(options.queryParameters.length, 3);
      expect(options.queryParameters["ts"], isNotNull);
      expect(options.queryParameters["apikey"], isNotNull);
      expect(options.queryParameters["hash"], isNotNull);
    });
  });
}
