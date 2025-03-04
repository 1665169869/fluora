/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-02 19:31:49
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-04 23:13:31
 * @FilePath: \fluora\lib\application.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */
import 'package:fluora/pages/not_found.dart';
import 'package:fluora/routes/index.dart';
import 'package:fluora/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'fluora',
      theme: lightTheme,
      initialRoute: Routes.home,
      getPages: Routes.pages,
      unknownRoute: GetPage(name: Routes.notFound, page: () => NotFound()),
    );
  }
}
