import 'package:desafio_objective/src/entities/comic.dart';
import 'package:flutter/material.dart';

class ComicsListTile extends StatelessWidget {
  final Comic comic;
  const ComicsListTile({required this.comic, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ListTile(
        title: Text(comic.name),
      ),
    );
  }
}
