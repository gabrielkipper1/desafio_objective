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
        child: SizedBox(
          width: 500,
          child: TextFormField(
            key: const Key("search_bar"),
            controller: _searchTextController,
            decoration: InputDecoration(
              focusColor: Theme.of(context).primaryColor,
              hintText: "Nome do personagem",
              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
              hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
              prefixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.primary),
            ),
            onChanged: (value) =>
                Provider.of<CharacterListBloc>(context, listen: false).add(SearchCharactersEvent(query: value, limit: 4, offset: 0)),
          ),
        ),
      ),
    );
  }
}
