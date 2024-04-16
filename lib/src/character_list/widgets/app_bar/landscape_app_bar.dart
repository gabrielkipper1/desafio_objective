import 'package:auto_size_text/auto_size_text.dart';
import 'package:desafio_objective/src/character_list/widgets/app_bar/change_theme_button.dart';
import 'package:flutter/material.dart';

class LandscapeAppBar extends StatelessWidget {
  const LandscapeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Lista de personagens",
            key: const Key("app_bar_title"),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Row(
            children: [
              AutoSizeText("Gabriel Limberger", minFontSize: 10, maxFontSize: 25, style: Theme.of(context).textTheme.headlineMedium),
              const ChangeThemeButton(),
            ],
          ),
        ],
      ),
    );
  }
}
