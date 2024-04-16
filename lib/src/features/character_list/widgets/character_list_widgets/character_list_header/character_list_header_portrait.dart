import 'package:flutter/material.dart';

class CharacterListHeaderPortrait extends StatelessWidget {
  const CharacterListHeaderPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          //rouded corners
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: Theme.of(context).primaryColor,
          ),
          height: 30,
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
    );
  }
}
