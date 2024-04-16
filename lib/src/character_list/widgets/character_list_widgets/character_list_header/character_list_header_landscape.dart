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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                  height: 30,
                  color: Theme.of(context).colorScheme.primary,
                  key: const Key("list_header_name"),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text("Personagem",
                            style: TextStyle(color: Theme.of(context).colorScheme.background, fontWeight: FontWeight.w600)),
                      ))),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 30,
                color: Theme.of(context).colorScheme.primary,
                key: const Key("list_header_serie"),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Séries",
                      style: TextStyle(color: Theme.of(context).colorScheme.background, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 30,
                color: Theme.of(context).colorScheme.primary,
                key: const Key("list_header_event"),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Eventos",
                      style: TextStyle(color: Theme.of(context).colorScheme.background, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
