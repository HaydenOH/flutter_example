import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class InfiniteScrollController extends GetxController {
  var scrollController = ScrollController().obs;
  var data = <int>[].obs;
  var isLoading = false.obs;
  var hasMore = false.obs;

  @override
  void onInit() {
    _getData();
    this.scrollController.value.addListener(() {
      if (this.scrollController.value.position.pixels ==
              this.scrollController.value.position.maxScrollExtent &&
          this.hasMore.value) {
        _getData();
      }
    });
    super.onInit();
  }

  _getData() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    int offset = data.length;
    var appendData = List<int>.generate(10, (i) => i + 1 + offset);
    data.addAll(appendData);
    isLoading.value = false;
    hasMore.value = data.length < 30;
  }

  reload() async {
    isLoading.value = true;
    data.clear();
    await Future.delayed(Duration(seconds: 2));
    _getData();
  }
}
