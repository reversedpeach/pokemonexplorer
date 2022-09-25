class PokeModel {
  String name;
  var sprites;
  int num;

  PokeModel({
    required this.name,
    required this.sprites,
    this.num = 1,
  });

  void setNum(int newNum) {
    num = newNum;
  }

  void increaseNum() {
    num++;
  }

  void decreaseNum() {
    num--;
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

  void setPokemon(Map<String, dynamic> json) {
    name = json["name"];
    sprites = json["sprites"];
  }

  String getPokeName() {
    return name;
  }

  String getPokeImg() {
    return sprites["front_default"];
  }
}
