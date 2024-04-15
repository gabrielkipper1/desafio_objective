import 'package:desafio_objective/src/character_list/bloc/character_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterListSearchBar extends StatefulWidget {
  final Function(String)? onSearchChanged;
  const CharacterListSearchBar({this.onSearchChanged, super.key});

  @override
  State<CharacterListSearchBar> createState() => _CharacterListSearchBarState();
}

class _CharacterListSearchBarState extends State<CharacterListSearchBar> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchBar(
          key: const Key("search_bar"),
          controller: _searchTextController,
          onChanged: (value) =>
              Provider.of<CharacterListBloc>(context, listen: false).add(SearchCharactersEvent(query: value, limit: 4, offset: 0)),
        ),
      ),
    );
  }
}
