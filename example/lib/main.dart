import 'package:example/provider/app_binding.dart';
import 'package:example/provider/loanding_page_controller.dart';
import 'package:example/screens/main_page.dart';
import 'package:example/screens/my_gc_page.dart';
import 'package:example/screens/social_page.dart';
import 'package:example/screens/trending_page.dart';
import 'package:example/styles/global_theme.dart';
import 'package:example/widgets/bottom_navigation.dart';
import 'package:example/widgets/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'dart:ui' as ui;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]); //세로 고정
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Practice',
      initialBinding: AppBinding(),
      // 다크 라이트 모드 /////
      themeMode: ThemeMode.system,
      theme: GlobalTheme.lightTheme,
      darkTheme: GlobalTheme.darkTheme,
      /////////////////////////
      home: MyHomePage(),
      // getPages: [GetPage(name: "/main", page: () => MainPage())],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // footer button landing page
  final LandingPageController landingPageController =
      Get.put(LandingPageController(), permanent: false);

  //  text 그라데이션 효과
  final Shader linearGradientShader = ui.Gradient.linear(
      const Offset(0, 20),
      const Offset(150, 20),
      <Color>[const Color(0xff2a81fd), const Color(0xffed10f7)]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Row(children: [
                Row(
                  children: [
                    ThemeChanger(),
                    Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xff2a81fd),
                                const Color(0xffed10f7)
                              ])),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Gamer's Coin",
                      style: TextStyle(
                          fontSize: 20,
                          foreground: Paint()..shader = linearGradientShader),
                    )
                  ],
                ),
              ]),
              actions: [
                IconButton(
                  onPressed: () {
                    // 페이지 저장시 사용
                  },
                  icon: Icon(Icons.info_outline_rounded),
                )
              ],
            ),
            body: Obx(
              () => IndexedStack(
                index: landingPageController.tabIndex.value,
                children: [
                  MainPage(),
                  TrendingPage(),
                  SocialPage(),
                  MyGCPage(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigation()));
    ;
  }
}
