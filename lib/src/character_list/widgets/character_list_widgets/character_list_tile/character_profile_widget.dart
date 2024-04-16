import 'package:desafio_objective/src/entities/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharacterProfileWidget extends StatelessWidget {
  final Character character;
  const CharacterProfileWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text(
            character.name,
            key: const Key("character_name"),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.network(
              key: const Key("character_image"),
              width: 58,
              height: 58,
              fit: BoxFit.contain,
              scale: 1,
              character.thumbnail.fullPath,
            ),
          ),
        ),
      ),
    );
  }
}
