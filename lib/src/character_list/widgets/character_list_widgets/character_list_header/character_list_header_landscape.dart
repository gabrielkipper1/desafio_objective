import 'package:flutter/material.dart';

class CharacterListHeaderLandscape extends StatelessWidget {
  const CharacterListHeaderLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(height: 30, color: Colors.red, key: const Key("list_header_name"), child: const Text("Nome")),
          ),
          Expanded(
            flex: 1,
            child: Container(height: 30, color: Colors.red, key: const Key("list_header_serie"), child: const Text("serie")),
          ),
          Expanded(
            flex: 2,
            child: Container(height: 30, color: Colors.red, key: const Key("list_header_event"), child: const Text("event")),
          ),
        ],
      ),
    );
  }
}
