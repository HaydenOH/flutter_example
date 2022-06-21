import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:gex_multi_lang_example/binding/lang_binding.dart';
import 'package:gex_multi_lang_example/lang/app_translation.dart';
import 'package:gex_multi_lang_example/next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter INTERNATIONALIZATION',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 언어 팩 Map 구조 클래스 적용
      translations: AppTranslation(),
      // 디폴트 언어 옵션 => 기기에 맞춤
      locale: Get.deviceLocale,
      // 언어 설정에 벗어난 언어는 영어로 보이게 하기
      fallbackLocale: const Locale('en', 'US'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      getPages: [GetPage(name: "/main", page: () => NextPage())],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

//Get.updateLocale(const Locale('ur', 'PK'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton(
                items: <String>["ko_KR", "en_US", "ur_PK"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newVal) {
                  if (newVal != null) {
                    var splittedVal = newVal.split("_");
                    Get.updateLocale(Locale(
                        splittedVal[0].toString(), splittedVal[1].toString()));
                  }
                },
                icon: const Icon(Icons.arrow_downward)),
            TextButton(
              onPressed: () {
                Get.to(const NextPage());
              },
              child: Text('enter_mail'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
