/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-04 21:28:53
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-06 22:56:31
 * @FilePath: \fluora\lib\pages\home\view.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */
import 'package:fluora/constants/bottom_nav_bar_data.dart';
import 'package:fluora/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key, required this.label});

  final String label;

  Widget _buildView() {
    return Navigator(
      key: Get.nestedKey(controller.currentNavigatorKey),
      initialRoute: Routes.folder,
      onGenerateRoute: controller.onGenerateRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      body: _buildView(),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          destinations: navigationDestinations,
          onDestinationSelected: controller.changeSelected,
          selectedIndex: controller.selectedIndex.value,
        ),
      ),
    );
  }
}
