import 'package:flutter/material.dart';

class CharacterListInitialMessageWidget extends StatelessWidget {
  const CharacterListInitialMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Bem vindo ao aplicativo de personagens da Marvel!",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  key: Key("welcome_message"),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Digite o nome de um personagem no campo de busca para começar a explorar.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    key: Key("welcome_instruction"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
