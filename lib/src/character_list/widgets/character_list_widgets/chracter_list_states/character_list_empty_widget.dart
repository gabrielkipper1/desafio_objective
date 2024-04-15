import 'package:flutter/material.dart';

class CharacterListEmptyWidget extends StatelessWidget {
  const CharacterListEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 50,
              color: Colors.red,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                key: Key("empty_message"),
                "Nenhum personagem encontrado.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
