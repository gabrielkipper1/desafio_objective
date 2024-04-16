import 'package:desafio_objective/src/entities/character.dart';
import 'package:flutter/material.dart';

class CharacterProfileDetailed extends StatelessWidget {
  final Character character;
  const CharacterProfileDetailed({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Image.network(
            character.thumbnail.fullPath,
            width: 200,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Text(
              character.name,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
            child: Text(
              character.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
