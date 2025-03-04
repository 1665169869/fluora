import 'package:fluora/page_context.dart';
import 'package:fluora/pages/folder/index.dart';
import 'package:fluora/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;

  int routeKeyId = 1;

  final List<String> pages = [
    Routes.folder,
    Routes.cloud,
    Routes.playlist,
    Routes.download,
  ];

  void changeSelected(int index) {
    if (selectedIndex.value != index) {
      selectedIndex.value = index;
      changePage(index);
    }
  }

  void changePage(int index) {
    Get.offAllNamed(pages[index], id: routeKeyId);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.folder) {
      return GetPageRoute(
        settings: settings,
        page: () => FolderView(),
        transition: Transition.fadeIn,
      );
    } else if (settings.name == Routes.cloud) {
      return GetPageRoute(
        settings: settings,
        page: () => PageContext(title: "云端内容"),
        transition: Transition.fadeIn,
      );
    } else if (settings.name == Routes.playlist) {
      return GetPageRoute(
        settings: settings,
        page: () => PageContext(title: "播放列表"),
        transition: Transition.fadeIn,
      );
    } else if (settings.name == Routes.download) {
      return GetPageRoute(
        settings: settings,
        page: () => PageContext(title: "下载队列"),
        transition: Transition.fadeIn,
      );
    }

    // 未匹配到任何路由 跳转到Not_Found
    Get.toNamed(Routes.notFound);
    return null;
  }
}
