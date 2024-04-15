import 'package:desafio_objective/src/character_list/pages/character_list_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Characters',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, name: MOBILE, end: 600),
          const Breakpoint(start: 600, name: DESKTOP, end: 1024),
        ],
        child: child!,
      ),
      home: const CharacterListPage(),
    );
  }
}
