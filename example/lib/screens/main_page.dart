import 'package:example/widgets/main_game_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    //   return ListView.builder((ctx, idx){
    //     if(idx == 0){
    //       return Text("Today's Token Prices"),
    //     }else if(idx==1){
    //       return  Expanded(child: MainGameList()),
    //     }
    //   }
    //     itemCount: 5,
    //   );
  }
}
