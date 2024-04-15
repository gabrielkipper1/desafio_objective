import 'package:desafio_objective/src/character_detail/widgets/list_tiles/url_list_tile.dart';
import 'package:desafio_objective/src/entities/marvel_url.dart';
import 'package:flutter/material.dart';

class CharacterUrlList extends StatelessWidget {
  final List<MarvelUrl> urls;
  const CharacterUrlList({required this.urls, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          AppBar(title: const Text("URLs")),
          for (var url in urls) UrlListTile(url: url),
        ],
      ),
    );
  }
}
