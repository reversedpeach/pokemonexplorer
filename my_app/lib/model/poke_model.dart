import 'dart:convert';

PokeModel PokeModelFromJson(String str) => PokeModel.fromJson(json.decode(str));

String PokeModelToJson(PokeModel data) => json.encode(data.toJson());

class PokeModel {
  PokeModel({
    required this.name,
    required this.sprites,
  });

  String name;
  var sprites;

  factory PokeModel.fromJson(Map<String, dynamic> json) =>
      PokeModel(name: json["name"], sprites: json["sprites"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "sprites": sprites,
      };
}
