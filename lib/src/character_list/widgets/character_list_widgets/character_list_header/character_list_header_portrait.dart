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
              color: Theme.of(context).primaryColor,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Nome",
                    style: TextStyle(color: Theme.of(context).primaryColorLight, fontWeight: FontWeight.w600),
                    key: const Key("list_header_name"),
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
