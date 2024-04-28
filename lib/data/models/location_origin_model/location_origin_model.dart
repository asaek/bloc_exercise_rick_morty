import 'dart:convert';

class LocationOriginModel {
  final int id;
  final String name;
  final String planetType;
  final String dimension;
  final List<String> residents;
  final String url;
  final DateTime created;

  LocationOriginModel({
    required this.id,
    required this.name,
    required this.planetType,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory LocationOriginModel.fromRawJson(String str) =>
      LocationOriginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationOriginModel.fromJson(Map<String, dynamic> json) =>
      LocationOriginModel(
        id: json["id"],
        name: json["name"],
        planetType: json["type"],
        dimension: json["dimension"],
        residents: List<String>.from(json["residents"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": planetType,
        "dimension": dimension,
        "residents": List<dynamic>.from(residents.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
