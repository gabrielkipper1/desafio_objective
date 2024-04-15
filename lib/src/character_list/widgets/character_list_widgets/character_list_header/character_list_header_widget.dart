import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_header/character_list_header_landscape.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_header/character_list_header_portrait.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CharacterListHeaderWidget extends StatelessWidget {
  const CharacterListHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context).breakpoint;

    if (breakpoint.name == MOBILE) {
      return const CharacterListHeaderPortrait(key: Key("portrait_header"));
    }

    return const CharacterListHeaderLandscape(key: Key("landscape_header"));
  }
}
