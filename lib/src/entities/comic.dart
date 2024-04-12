final class Comic {
  final String resourceURI;
  final String name;

  Comic({
    required this.resourceURI,
    required this.name,
  });

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }
}
