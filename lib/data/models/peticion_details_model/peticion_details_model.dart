import '../models.dart';

class PeticionDetailsModel {
  final int count;
  final int pages;
  final String? next;
  final String? prev;
  final List<CharacterModel> charactersModel;
  PeticionDetailsModel({
    required this.charactersModel,
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  // factory PeticionDetailsModel.fromRawJson(String str) =>
  //     PeticionDetailsModel.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  factory PeticionDetailsModel.fromJson(Map<String, dynamic> json) =>
      PeticionDetailsModel(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
        charactersModel: List<CharacterModel>.from(
          json["results"].map((x) => CharacterModel.fromJson(x)),
        ),
      );

  // Map<String, dynamic> toJson() => {
  //       "count": count,
  //       "pages": pages,
  //       "next": next,
  //       "prev": prev,
  //     };
}
