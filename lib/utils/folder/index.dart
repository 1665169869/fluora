/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-02 21:56:39
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-02 22:05:40
 * @FilePath: \fluora\lib\utils\folder\index.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */

import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Folder {
  static final String root =
      Platform.isAndroid ? "/storage/emulated/0" : "/Users/Shared";

  static void getDirectory(String path) {
    final Directory dir = Directory(path);

    final Stream<String> dirList = dir.list().map((e) {
      return e.path;
    });
  }
}
