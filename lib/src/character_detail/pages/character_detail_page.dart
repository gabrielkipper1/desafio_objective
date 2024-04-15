import 'package:desafio_objective/src/character_detail/widgets/character_url_list.dart';
import 'package:desafio_objective/src/character_detail/widgets/list_tiles/story_list_tile.dart';
import 'package:desafio_objective/src/character_detail/widgets/modal/character_collection_modal_content.dart';
import 'package:desafio_objective/src/character_detail/widgets/character_profile_detailed.dart';
import 'package:desafio_objective/src/character_detail/widgets/list_tiles/comics_list_tile.dart';
import 'package:desafio_objective/src/character_detail/widgets/list_tiles/serie_list_tile.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/comic.dart';
import 'package:desafio_objective/src/entities/event.dart';
import 'package:desafio_objective/src/entities/serie.dart';
import 'package:desafio_objective/src/entities/story.dart';
import 'package:flutter/material.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;
  const CharacterDetailPage({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detalhes do personagem"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CharacterProfileDetailed(
                character: character,
              ),
              ListTile(
                key: const Key("series_tile"),
                title: const Text("Séries"),
                trailing: Text(character.comics.available.toString()),
                onTap: () => openSeries(context),
              ),
              ListTile(
                key: const Key("comics_tile"),
                title: const Text("Comics"),
                trailing: Text(character.comics.available.toString()),
                onTap: () => openComics(context),
              ),
              ListTile(
                key: const Key("events_tile"),
                title: const Text("Eventos"),
                trailing: Text(character.events.available.toString()),
                onTap: () => openEvents(context),
              ),
              ListTile(
                key: const Key("stories_tile"),
                title: const Text("Histórias"),
                trailing: Text(character.stories.available.toString()),
                onTap: () => openStories(context),
              ),
              ListTile(
                key: const Key("links_tile"),
                title: const Text("Links"),
                onTap: () => openUrls(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openSeries(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CharacterCollectionModalContent<Serie>(
        pageTitle: "Séries",
        collectionData: character.series,
        itemListBuilder: (item) => SerieListTile(serie: item),
      ),
    );
  }

  void openComics(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CharacterCollectionModalContent<Comic>(
        pageTitle: "Comics",
        collectionData: character.comics,
        itemListBuilder: (item) => ComicsListTile(
          comic: item,
        ),
      ),
    );
  }

  void openStories(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CharacterCollectionModalContent<Story>(
        pageTitle: "Histórias",
        collectionData: character.stories,
        itemListBuilder: (item) => StoryListTile(story: item),
      ),
    );
  }

  void openUrls(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) => CharacterUrlList(urls: character.urls));
  }

  void openEvents(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CharacterCollectionModalContent<Event>(
        pageTitle: "Eventos",
        collectionData: character.events,
        itemListBuilder: (item) => ListTile(
          title: Text(item.name),
        ),
      ),
    );
  }
}
