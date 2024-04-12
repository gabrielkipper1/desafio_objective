final class MarvelUrl {
  final String type;
  final String url;

  MarvelUrl({required this.type, required this.url});

  factory MarvelUrl.fromJson(Map<String, dynamic> json) {
    return MarvelUrl(
      type: json['type'],
      url: json['url'],
    );
  }
}
