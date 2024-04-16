import 'package:desafio_objective/src/entities/marvel_url.dart';
import 'package:flutter/material.dart';

class UrlListTile extends StatelessWidget {
  final MarvelUrl url;
  const UrlListTile({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ListTile(
        title: Text(
          url.type,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(url.url),
      ),
    );
  }
}
