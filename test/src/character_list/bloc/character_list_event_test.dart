import 'package:desafio_objective/src/character_list/bloc/character_list_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("Character List Event", () {
    test("Should be a subclass of Equatable and props list be empty", () {
      var event = const SearchCharactersEvent(query: "Spider", offset: 0, limit: 4);
      expect(event, isA<Equatable>());
      expect(event.props, isEmpty);
    });

    test("Should be a subclass of Equatable and props list be empty", () {
      var event = const ChangePageEvent(page: 1, limit: 4, query: "Spider");
      expect(event, isA<Equatable>());
      expect(event.props, isEmpty);
    });
  });
}
