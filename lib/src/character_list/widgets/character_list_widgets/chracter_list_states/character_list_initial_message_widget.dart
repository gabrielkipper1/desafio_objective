import 'package:flutter/material.dart';

class CharacterListInitialMessageWidget extends StatelessWidget {
  const CharacterListInitialMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Bem vindo ao aplicativo de personagens da Marvel!",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                  key: const Key("welcome_message"),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Digite o nome de um personagem no campo de busca para começar a explorar.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Theme.of(context).disabledColor),
                    key: const Key("welcome_instruction"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
