import 'package:desafio_objective/src/features/character_detail/pages/character_detail_page.dart';
import 'package:desafio_objective/src/features/character_list/pages/character_list_page.dart';
import 'package:desafio_objective/src/interceptors/dio/marvel_auth_interceptor_dio.dart';
import 'package:desafio_objective/src/repositories/character_repository/character_repository.dart';
import 'package:desafio_objective/src/repositories/character_repository/marvel_character_service.dart';
import 'package:desafio_objective/src/repositories/http_client/dio_http.dart';
import 'package:desafio_objective/src/repositories/http_client/http_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.add(MarvelAuthInterceptorDio.new);
    i.add<HttpRepository>(DioHttp.new);
    i.add<CharacterRepository>(MarvelCharacterService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (context) => const CharacterListPage());
    r.child("/character_detail", child: (context) => CharacterDetailPage(character: r.args.data));
  }
}
