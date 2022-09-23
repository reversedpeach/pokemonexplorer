import 'package:flutter/foundation.dart';
import 'package:my_app/model/poke_model.dart';

import '../model/api_service.dart';

// Have to initialize the first pokemon
class PokeViewModel {
  int num;
  late PokeModel _PokeModel;
  bool loading = true;

  PokeViewModel({
    required this.num,
  });

  void increaseNum() {
    num++;
  }

  void decreaseNum() {
    num--;
  }

  bool loadingStatus() {
    return loading;
  }

  void loadingFalse() {
    loading = false;
  }

  void loadingTrue() {
    loading = true;
  }

  void changeNum(String numString) {
    num = int.parse(numString);
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
    _PokeModel = (await ApiService().getUsers(num))!;
    loading = false;
    //Future.delayed(const Duration(milliseconds: 0))
    //   .then((value) => setState(() {}));
  }

  String getPokeName() {
    return _PokeModel.getPokeName();
  }

  String getPokeImg() {
    return _PokeModel.getPokeImg();
  }
}
