final class Story {
  final String resourceURI;
  final String name;
  final String type;

  Story({
    required this.resourceURI,
    required this.name,
    required this.type,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      resourceURI: json['resourceURI'],
      name: json['name'],
      type: json['type'],
    );
  }
}
