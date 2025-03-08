/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-04 21:28:23
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-08 15:51:08
 * @FilePath: \fluora\lib\pages\home\controller.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */
import 'package:fluora/page_context.dart';
import 'package:fluora/pages/folder/index.dart';
import 'package:fluora/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;


  // 获取当前导航键
  int get currentNavigatorKey => Routes.home.hashCode;

  final List<String> pages = [
    Routes.folder,
    Routes.cloud,
    Routes.playlist,
    Routes.download,
  ];

  void changeSelected(int index) {
    if (selectedIndex.value == index) return;

    selectedIndex.value = index;
    Get.offAllNamed(pages[index], id: currentNavigatorKey);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.folder:
        return _buildPageRoute(() => FolderView(), settings);
      case Routes.cloud:
        return _buildPageRoute(() => PageContext(title: "云端内容"), settings);
      case Routes.playlist:
        return _buildPageRoute(() => PageContext(title: "播放列表"), settings);
      case Routes.download:
        return _buildPageRoute(() => PageContext(title: "下载队列"), settings);
      default:
        return null;
    }
  }

  GetPageRoute _buildPageRoute(Widget Function() page, RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      page: page,
      transition: Transition.fadeIn,
      // 关键：绑定到当前导航键
      binding: BindingsBuilder.put(() => this),
    );
  }
}
