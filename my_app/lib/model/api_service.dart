import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:my_app/constants.dart';
import 'package:my_app/model/poke_model.dart';

class ApiService {
  // update to model instead
  Future<PokeModel?> getUsers(int num) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + "/" + num.toString());
      print(url);
      var response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        PokeModel _model = PokeModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
