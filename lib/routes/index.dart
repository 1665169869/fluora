/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-04 20:32:39
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-06 22:46:09
 * @FilePath: \fluora\lib\routes\index.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */
import 'package:fluora/pages/home/index.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const String home = '/';
  static const String folder = '/folder';
  static const String cloud = '/cloud';
  static const String playlist = '/playlist';
  static const String download = '/download';
  static const String settings = '/settings';
  static const String notFound = '/not_found';

  static List<GetPage> get pages => [
    GetPage(name: home, page: () => HomePage(label: "home")),
  ];
}
