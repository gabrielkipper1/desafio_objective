import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_header/character_list_header_widget.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_tile/character_list_tile_builder.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharacterListView extends StatefulWidget {
  final MarvelApiRequestData<Character> request;
  const CharacterListView({required this.request, super.key});

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          key: const Key("character_list"),
          children: [
            const CharacterListHeaderWidget(key: Key("list_header")),
            for (var character in widget.request.results)
              Card(
                child: InkWell(
                  onTap: () => Modular.to.pushNamed("/character_detail", arguments: character),
                  radius: 20,
                  child: CharacterListTileBuilder(
                    character: character,
                  ),
                ),
              ),
            // const CharacterListPaginator()
          ],
        ),
      ),
    );
  }
}
