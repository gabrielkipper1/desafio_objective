import 'package:desafio_objective/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MaterialAppWidget extends StatefulWidget {
  const MaterialAppWidget({super.key});

  @override
  State<MaterialAppWidget> createState() => _MaterialAppWidgetState();
}

class _MaterialAppWidgetState extends State<MaterialAppWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => MaterialApp.router(
          title: 'Marvel Characters',
          themeMode: value.themeMode,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.dark),
            useMaterial3: true,
          ),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            useMaterial3: true,
          ),
          builder: (context, child) => ResponsiveBreakpoints.builder(
            breakpoints: [
              const Breakpoint(start: 200, name: MOBILE, end: 700),
              const Breakpoint(start: 600, name: DESKTOP, end: 5000),
            ],
            child: child!,
          ),
          routerConfig: Modular.routerConfig,
          // home: const CharacterListPage(),
        ),
      ),
    );
  }
}
