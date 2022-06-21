import 'package:flutter/material.dart';

class AdvertiseCard extends StatelessWidget {
  // final ImageProvider url;
  const AdvertiseCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Image(
      //   image: "",
      // ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.amber),
      height: 140,
      width: 335,
    );
  }
}
