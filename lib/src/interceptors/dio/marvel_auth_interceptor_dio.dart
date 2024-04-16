import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:desafio_objective/src/providers/api_credentials.dart';
import 'package:dio/dio.dart';

class MarvelAuthInterceptorDio extends Interceptor {
  final APICredentials credentials = APICredentials();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = md5.convert(utf8.encode('$ts${credentials.privateKey}${credentials.publicKey}')).toString();

    options.queryParameters.addAll({
      'ts': ts,
      'apikey': credentials.publicKey,
      'hash': hash,
    });

    super.onRequest(options, handler);
  }
}
