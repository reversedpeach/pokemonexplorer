import 'package:flutter/foundation.dart';
import 'package:my_app/model/poke_model.dart';

import '../model/api_service.dart';

// Have to initialize the first pokemon
class PokeViewModel with ChangeNotifier {
  int num = 1;
  late PokeModel model;
  bool loading = true;

  void increaseNum() {
    num++;
    notifyListeners();
  }

  void decreaseNum() {
    num--;
    notifyListeners();
  }

  bool loadingStatus() {
    return loading;
  }

  void loadingFalse() {
    loading = false;
    notifyListeners();
  }

  void loadingTrue() {
    loading = true;
    notifyListeners();
  }

  void changeNum(String numString) {
    num = int.parse(numString);
    notifyListeners();
  }

  int getNumInt() {
    return num;
  }

  String getNumString() {
    return num.toString();
  }

  Future getData() async {
    // viewmodel
    // set in model
    model = (await ApiService().getUsers(num))!;

    loading = false;
    notifyListeners();
    //Future.delayed(const Duration(milliseconds: 0))
    //   .then((value) => setState(() {}));
  }

  String getPokeName() {
    return model.getPokeName();
  }

  String getPokeImg() {
    return model.getPokeImg();
  }
}
