import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:my_app/constants.dart';
import 'package:my_app/model/poke_model.dart';

class ApiService {
  Future<PokeModel?> getPokemon(PokeModel model) async {
    try {
      var url = Uri.parse("${ApiConstants.baseUrl}/${model.getNumString()}");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        model.setPokemon(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
