part of 'character_list_bloc.dart';

sealed class CharacterListEvent extends Equatable {
  const CharacterListEvent();

  @override
  List<Object> get props => [];
}

class SearchCharactersEvent extends CharacterListEvent {
  final String query;
  final int offset;
  final int limit;

  const SearchCharactersEvent({
    required this.query,
    required this.offset,
    required this.limit,
  });
}

class ChangePageEvent extends CharacterListEvent {
  final int page;
  final int limit;
  final String query;
  const ChangePageEvent({required this.page, required this.limit, required this.query});
}
