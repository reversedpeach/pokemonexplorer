import 'dart:convert';

import 'package:flutter/material.dart';

PokeModel PokeModelFromJson(String str) => PokeModel.fromJson(json.decode(str));

class PokeModel {
  String name;
  var sprites;

  PokeModel({
    required this.name,
    required this.sprites,
  });

  factory PokeModel.fromJson(Map<String, dynamic> json) =>
      PokeModel(name: json["name"], sprites: json["sprites"]);

  String getPokeName() {
    return name;
  }

  String getPokeImg() {
    return sprites["front_default"];
  }
}
