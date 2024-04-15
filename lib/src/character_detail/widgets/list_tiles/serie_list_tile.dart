import 'package:desafio_objective/src/entities/serie.dart';
import 'package:flutter/material.dart';

class SerieListTile extends StatelessWidget {
  final Serie serie;
  const SerieListTile({required this.serie, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ListTile(
        title: Text(serie.name),
      ),
    );
  }
}
