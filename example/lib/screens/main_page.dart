import 'package:example/widgets/advertise_card.dart';
import 'package:example/widgets/main_game_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
       Text(
        "Today's Prices",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
      AdvertiseCard(),
      Text(
        "Today's Prices",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
      Text("1,000", style: TextStyle(fontFamily: "number", fontSize: 20)),
      Expanded(child: MainGameList()),
    ]);
  }
}
