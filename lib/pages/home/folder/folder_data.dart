/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-04 00:54:34
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-04 01:06:09
 * @FilePath: \fluora\lib\pages\home\folder\folder_data.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */

import 'dart:io';

import 'package:fluora/utils/folder/index.dart';

class FloderData {
  final String path;
  final String name;
  final bool isFile;
  final List<FileSystemEntity> dirList;

  FloderData({
    required this.path,
    required this.name,
    required this.isFile,
    required this.dirList,
  });
}

Future<FloderData> floderData(path) async {
  final name = Folder.getPathName(path);
  final isFile = Folder.isFile(path);
  final dir = Folder.getDirectory(path);

  final list = dir.list();
  final List<FileSystemEntity> dirList = [];

  await for (final file in list) {
    dirList.add(file);
  }

  // return Future.delayed(
  //   Duration(seconds: 1),
  //   () => FloderData(path: path, name: name, isFile: isFile, dirList: dirList),
  // );

  return FloderData(path: path, name: name, isFile: isFile, dirList: dirList);
}
