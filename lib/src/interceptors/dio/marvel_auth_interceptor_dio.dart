import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

class MarvelAuthInterceptorDio extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    const publicKey = "pub_key";
    const privateKey = "priv_key";
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = md5.convert(utf8.encode('$ts$privateKey$publicKey')).toString();

    options.queryParameters.addAll({
      'ts': ts,
      'apikey': publicKey,
      'hash': hash,
    });

    super.onRequest(options, handler);
  }
}
