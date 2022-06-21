import 'package:get/route_manager.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ko_KR": {'enter_mail': "이메일을 입력해주세요"},
        'en_US': {
          'enter_mail': 'Enter your email',
        },
        'ur_PK': {
          'enter_mail': 'اپنا ای میل درج کریں۔',
        }
      };
}
