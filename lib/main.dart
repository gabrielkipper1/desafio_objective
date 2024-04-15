import 'package:desafio_objective/src/app_module.dart';
import 'package:desafio_objective/src/material_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MaterialAppWidget()));
}
