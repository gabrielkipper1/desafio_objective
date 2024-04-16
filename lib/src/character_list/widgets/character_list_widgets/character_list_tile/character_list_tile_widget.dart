import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_tile/character_list_tile_landscape.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_tile/character_profile_widget.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CharacterListTileWidget extends StatelessWidget {
  final Character character;
  const CharacterListTileWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context).breakpoint;
    if (breakpoint.name == MOBILE) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CharacterProfileWidget(character: character),
      );
    } else {
      return CharacterListTileLandscapeWidget(character: character);
    }
  }
}
