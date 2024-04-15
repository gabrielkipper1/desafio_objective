import 'package:flutter/material.dart';

class CharacterListHeaderPortrait extends StatelessWidget {
  const CharacterListHeaderPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 30,
              color: Colors.red,
              child: const Text("Nome", key: Key("list_header_name")),
            ),
          ),
        ],
      ),
    );
  }
}
