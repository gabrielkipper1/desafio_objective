import 'package:desafio_objective/src/features/character_list/widgets/app_bar/change_theme_button.dart';
import 'package:flutter/material.dart';

class PortraitAppBar extends StatelessWidget {
  const PortraitAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        key: Key("app_bar_title"),
        "Lista de personagens",
      ),
      actions: const [ChangeThemeButton()],
    );
  }
}
