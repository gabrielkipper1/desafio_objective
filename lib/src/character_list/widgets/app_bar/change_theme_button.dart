import 'package:desafio_objective/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButton extends StatefulWidget {
  const ChangeThemeButton({super.key});

  @override
  State<ChangeThemeButton> createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton> {
  late bool isDark;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: IconButton(onPressed: () => changeTheme(), icon: isDark ? const Icon(Icons.brightness_4) : const Icon(Icons.brightness_7)),
    );
  }

  void changeTheme() {
    setState(() {
      isDark = !isDark;
      Provider.of<ThemeProvider>(context, listen: false).setThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    });
  }
}
