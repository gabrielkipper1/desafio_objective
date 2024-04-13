import 'package:desafio_objective/src/repositories/http_client/dio_http.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

class MockInterceptor extends Mock implements Interceptor {}

void main() {
  final dio = DioHttp();
  final dioAdapter = DioAdapter(dio: dio.client);

  group("Marvel Character Service", () {
    test("should create an with a list of interceptors", () {
      final service = DioHttp(interceptors: [MockInterceptor()]);
      expect(service.client.interceptors, contains(isA<MockInterceptor>()));
    });

    test("Should return a response", () async {
      dioAdapter.onGet("https://www.character.sample", (server) {
        server.reply(200, "{'success': true}");
      });

      final result = await dio.get("https://www.character.sample");
      expect(result, isA<Response>());
    });

    test("should register an interceptor", () {
      dio.registerInterceptor(MockInterceptor());
      expect(dio.client.interceptors, contains(isA<MockInterceptor>()));
    });
  });
}
