/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-06 22:20:32
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-08 15:32:15
 * @FilePath: \fluora\lib\pages\folder\controllers\file_controller.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */
import 'dart:async';

import 'package:fluora/entry/file_entry.dart';
import 'package:get/get.dart';

class FileController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<FileEntry> files = <FileEntry>[].obs;

  // 模拟异步加载文件列表
  Future<List<FileEntry>> loadFiles(String path) {
    final fakeData = [
      FileEntry(name: '文件夹A', path: '$path/文件夹A', isDirectory: true),
      FileEntry(name: '文件A.txt', path: '$path/文件A.txt', isDirectory: false),
      FileEntry(name: '文件夹B', path: '$path/文件夹B', isDirectory: true),
    ];
    final Completer<List<FileEntry>> completer = Completer<List<FileEntry>>();

    isLoading.value = true;
    Future.delayed(Duration(seconds: 1), () {
      isLoading.value = false;
      
      fakeData.sort((a,b) => a.isDirectory ? -1 : 1);
      files.value = fakeData;
      completer.complete(fakeData);
    });
    return completer.future;
  }
}
