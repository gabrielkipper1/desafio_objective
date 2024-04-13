import 'package:desafio_objective/src/repositories/http_client/http_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

class MockInterceptor extends Interceptor {}

class HttpRepositoryTest implements HttpRepository {
  List<dynamic> interceptors;
  HttpRepositoryTest({dynamic inteterceptor}) : interceptors = [];

  @override
  Future get(String url, {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) async {
    return "success";
  }

  @override
  void registerInterceptor(interceptor) {
    interceptors.add(interceptor);
  }
}

@GenerateMocks([HttpRepository])
void main() {
  group("Http Repository", () {
    test("Should call get method and get a 'success' response", () async {
      final httpRepository = HttpRepositoryTest();
      final result = await httpRepository.get("test");
      expect(result, "success");
    });

    test("Should call registerInterceptor method", () async {
      final httpRepository = HttpRepositoryTest();
      httpRepository.registerInterceptor(MockInterceptor());
      expect(httpRepository.interceptors.length, 1);
    });
  });
}
