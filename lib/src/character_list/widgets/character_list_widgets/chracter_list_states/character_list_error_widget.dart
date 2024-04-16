import 'package:flutter/material.dart';

class CharacterListErrorWidget extends StatelessWidget {
  final String errorMessage;
  const CharacterListErrorWidget({required this.errorMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Icon(
            Icons.error,
            size: 50,
            color: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              key: const Key("error_message"),
              errorMessage,
            ),
          ),
        ],
      ),
    );
  }
}
