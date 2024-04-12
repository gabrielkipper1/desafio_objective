final class MarvelApiRequestData<T> {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<T> results;

  MarvelApiRequestData({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory MarvelApiRequestData.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return MarvelApiRequestData(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      results: (json['results'] as List).map((e) => fromJson(e)).toList(),
    );
  }
}
