//T must be the interceptor type
abstract class HttpRepository<T> {
  Future<dynamic> get(String url, {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});
  void registerInterceptor(T interceptor);
}
