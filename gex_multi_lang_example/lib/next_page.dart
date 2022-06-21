import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Scaffold(body: Text('enter_mail'.tr)),
    ));
  }
}
