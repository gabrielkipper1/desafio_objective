import 'package:desafio_objective/src/entities/comic.dart';
import 'package:desafio_objective/src/entities/event.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_collection_data.dart';
import 'package:desafio_objective/src/entities/marvel_url.dart';
import 'package:desafio_objective/src/entities/serie.dart';
import 'package:desafio_objective/src/entities/story.dart';
import 'package:desafio_objective/src/entities/thumbnail.dart';

class Character {
  final int id;
  final String name;
  final String description;
  final String modified;
  final String resourceURI;
  final MarvelAPICollectionData<Comic> comics;
  final MarvelAPICollectionData<Story> stories;
  final MarvelAPICollectionData<Event> events;
  final MarvelAPICollectionData<Serie> series;
  final List<MarvelUrl> urls;
  final Thumbnail thumbnail;

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceURI,
    required this.comics,
    required this.stories,
    required this.events,
    required this.series,
    required this.urls,
    required this.thumbnail,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      modified: json['modified'],
      resourceURI: json['resourceURI'],
      comics: MarvelAPICollectionData.fromJson(json['comics'], (json) => Comic.fromJson(json)),
      stories: MarvelAPICollectionData.fromJson(json['stories'], (json) => Story.fromJson(json)),
      events: MarvelAPICollectionData.fromJson(json['events'], (json) => Event.fromJson(json)),
      series: MarvelAPICollectionData.fromJson(json['series'], (json) => Serie.fromJson(json)),
      urls: (json['urls'] as List).map((json) => MarvelUrl.fromJson(json)).toList(),
      thumbnail: Thumbnail.fromJson(json['thumbnail']),
    );
  }
}
