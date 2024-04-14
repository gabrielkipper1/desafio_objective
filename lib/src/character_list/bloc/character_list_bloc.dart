import 'package:bloc/bloc.dart';
import 'package:desafio_objective/src/character_list/use_cases/search_characters_use_case.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:desafio_objective/src/repositories/character_repository/character_repository.dart';
import 'package:equatable/equatable.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  //later we can change it for a DI conteiner like getIt or flutter_modular
  late CharacterRepository characterRepository;
  late SearchCharactersUseCase searchCharactersUseCase = SearchCharactersUseCase(characterRepository);

  CharacterListBloc({required this.characterRepository}) : super(CharacterListInitial()) {
    on<CharacterListEvent>(
      (event, emit) => switch (event) {
        SearchCharactersEvent() => searchForCharacters(event, emit),
        ChangePageEvent() => changePage(event, emit),
      },
    );
  }

  Future searchForCharacters(SearchCharactersEvent event, Emitter<CharacterListState> emit) async {
    emit(const CharacterListLoading());
    try {
      final requestData = await searchCharactersUseCase.searchCharacters(query: event.query, offset: event.offset, limit: event.limit);
      emit(CharacterListLoaded(requestData));
    } catch (e) {
      emit(CharacterListError(e.toString()));
    }
  }

  Future changePage(ChangePageEvent event, Emitter<CharacterListState> emit) async {
    emit(CharacterListPageChangedRequested(page: event.page));
    try {
      final requestData = await searchCharactersUseCase.searchCharacters(
        query: event.query,
        offset: (event.page * event.limit),
        limit: event.limit,
      );
      emit(CharacterListLoaded(requestData));
    } catch (e) {
      emit(CharacterListError(e.toString()));
    }
  }
}
