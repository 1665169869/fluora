/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-05 23:01:14
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-05 23:03:35
 * @FilePath: \fluora\lib\entry\file_entry.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */
class FileEntry {
  String name;
  String path;
  bool isDirectory;

  FileEntry({
    required this.name,
    required this.path,
    required this.isDirectory,
  });

  FileEntry.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      path = json['path'],
      isDirectory = json['isDirectory'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['path'] = path;
    data['isDirectory'] = isDirectory;
    return data;
  }
}
