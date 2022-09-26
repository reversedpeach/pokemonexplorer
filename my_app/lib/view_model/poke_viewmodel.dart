import 'package:flutter/foundation.dart';
import 'package:my_app/model/poke_model.dart';
import '../model/api_service.dart';

class PokeViewModel with ChangeNotifier {
  late PokeModel model;
  bool loading = true;

  PokeViewModel({
    required this.model,
  });

  void incButtonClick() {
    if (model.getNumInt() >= 999999999) {
      return;
    }
    model.increaseNum();
    loadingTrue();
    getData();
    notifyListeners();
  }

  void decButtonClick() {
    if (model.getNumInt() <= 1) {
      return;
    }
    model.decreaseNum();
    loadingTrue();
    getData();
    notifyListeners();
  }

  void queryInput(String query) {
    if (int.parse(query) <= 0) {
      return;
    }
    model.changeNum(query);
    loadingTrue();
    getData();
    notifyListeners();
  }

  String getPokeTitle() {
    return "${model.getNumString()} ${model.getPokeName()}";
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

  String getNumString() {
    return model.getNumString();
  }

  int getNumInt() {
    return model.getNumInt();
  }

  Future getData() async {
    model = (await ApiService().getPokemon(model))!;

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
