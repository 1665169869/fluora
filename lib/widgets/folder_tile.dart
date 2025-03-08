/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-08 15:36:59
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-08 15:45:35
 * @FilePath: \fluora\lib\widgets\folder_tile.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */

import 'package:fluora/entry/file_entry.dart';
import 'package:flutter/material.dart';

class FolderTile extends StatelessWidget {
  const FolderTile({super.key, required this.data, this.onTap});

  final FileEntry data;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: Icon(
        data.isDirectory ? Icons.folder_open : Icons.insert_drive_file,
        size: 48,
      ),
      title: Text(data.name),
      trailing: Icon(Icons.navigate_next, size: 28),
      onTap: onTap,
    );
  }
}
