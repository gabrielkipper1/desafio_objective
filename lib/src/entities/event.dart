class Event {
  final String resourceURI;
  final String name;

  Event({required this.resourceURI, required this.name});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }
}
