import 'package:get/instance_manager.dart';
import 'package:gex_multi_lang_example/controller/lnag_controller.dart';

class LangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LangController());
  }
}
