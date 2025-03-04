/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-04 20:32:39
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-04 21:34:38
 * @FilePath: \fluora\lib\routes\index.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */
import 'package:fluora/pages/home/index.dart';
import 'package:get/get.dart';

abstract class Routes {
  static String get home => '/';
  static String get folder => '/folder';
  static String get cloud => '/cloud';
  static String get playlist => '/playlist';
  static String get download => '/download';
  static String get settings => '/settings';
  static String get notFound => '/not_found';

  static List<GetPage> get pages => [
    GetPage(name: home, page: () => HomePage(label: "home")),
  ];
}
