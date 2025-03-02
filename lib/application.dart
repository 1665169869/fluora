/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-02 19:31:49
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-02 19:33:52
 * @FilePath: \fluora\lib\application.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */
import 'package:fluora/routes.dart';
import 'package:fluora/theme/light.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'fluora',
      theme: lightTheme,
      routerConfig: Routes.router,
    );
  }
}
