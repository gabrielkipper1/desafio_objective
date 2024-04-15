import 'package:desafio_objective/src/entities/generic/marvel_api_collection_data.dart';
import 'package:flutter/material.dart';

class CharacterCollectionModalContent<T> extends StatelessWidget {
  final String pageTitle;
  final MarvelAPICollectionData collectionData;
  final Function(T item) itemListBuilder;

  const CharacterCollectionModalContent({
    required this.pageTitle,
    required this.collectionData,
    required this.itemListBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text(pageTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [for (var item in collectionData.items) itemListBuilder.call(item)],
          ),
        ),
      ),
    );
  }
}
