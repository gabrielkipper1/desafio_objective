part of 'character_list_bloc.dart';

sealed class CharacterListState extends Equatable {
  const CharacterListState();

  @override
  List<Object> get props => [];
}

final class CharacterListInitial extends CharacterListState {}

final class CharacterListLoading extends CharacterListState {
  const CharacterListLoading();
}

final class CharacterListLoaded extends CharacterListState {
  final MarvelApiRequestData<Character> characters;
  const CharacterListLoaded(this.characters);
}

final class CharacterListError extends CharacterListState {
  final String message;
  const CharacterListError(this.message);
}

final class CharacterListPageChangedRequested extends CharacterListState {
  final int page;
  const CharacterListPageChangedRequested({required this.page});
}
