import 'dart:ffi';

class GameInfo {
  int grade;
  String gameImg;
  String coinName;
  String coinImg;
  String gameName;
  String genre;
  String mainnet;
  int price;
  int fluctuation;
  GameInfo(
      {this.grade = 0,
      this.gameImg = "",
      this.coinName = "",
      this.coinImg = "",
      this.gameName = "",
      this.genre = "",
      this.mainnet = "",
      this.price = 0,
      this.fluctuation = 0});
}
