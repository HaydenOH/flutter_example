import 'package:example/controller/infinity_scroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:example/controller/app_binding.dart';
import 'package:get/instance_manager.dart';

class MainGameList extends GetView<InfiniteScrollController> {
  const MainGameList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(InfiniteScrollController());
    return Obx(() => Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
            controller: controller.scrollController.value,
            itemBuilder: (ctx, index) {
              print(controller.hasMore.value);
              if (index < controller.data.length) {
                var datum = controller.data[index];
                return Material(
                    elevation: 10.0,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Icon(Icons.android_outlined),
                        title: Text('$datum 번째 데이터'),
                        trailing: Icon(Icons.arrow_forward_outlined),
                      ),
                    ));
              }
              if (controller.hasMore.value || controller.isLoading.value) {
                return Center(child: RefreshProgressIndicator());
              }
              return Container(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [
                      Text('데이터의 마지막 입니다'),
                      IconButton(
                        onPressed: () {
                          controller.reload();
                        },
                        icon: Icon(Icons.refresh_outlined),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) => Divider(),
            itemCount: controller.data.length + 1)));
  }
}
