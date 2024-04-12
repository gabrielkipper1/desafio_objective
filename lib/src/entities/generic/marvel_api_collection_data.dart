final class MarvelAPICollectionData<T> {
  final int available;
  final int returned;
  final String collectionURI;
  final List<T> items;

  MarvelAPICollectionData({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  factory MarvelAPICollectionData.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return MarvelAPICollectionData(
      available: json['available'],
      returned: json['returned'],
      collectionURI: json['collectionURI'],
      items: (json['items'] as List).map((e) => fromJson(e)).toList(),
    );
  }
}
