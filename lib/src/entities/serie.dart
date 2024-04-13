class Serie {
  final String name;
  final String resourceURI;

  Serie({
    required this.name,
    required this.resourceURI,
  });

  factory Serie.fromJson(Map<String, dynamic> json) {
    return Serie(
      name: json['name'],
      resourceURI: json['resourceURI'],
    );
  }
}
