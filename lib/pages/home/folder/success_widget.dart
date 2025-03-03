/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-04 00:53:39
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-04 01:07:50
 * @FilePath: \fluora\lib\pages\home\folder\success_widget.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */

import 'dart:io';

import 'package:fluora/pages/home/folder/folder_data.dart';
import 'package:fluora/routes.dart';
import 'package:fluora/utils/folder/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key, required this.data});
  final FloderData data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.dirList.length,
      itemBuilder: (context, index) {
        final FileSystemEntity file = data.dirList[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Icon(
            Folder.isFile(file.path) ? Icons.file_open : Icons.folder_open,
            size: 48,
          ),
          title: Text(Folder.getPathName(file.path)),
          trailing: Icon(Icons.navigate_next),
          onTap:
              () => context.push(
                Uri(
                  path: '/${Routes.folder.path}',
                  queryParameters: {'path': file.path},
                ).toString(),
              ),
        );
      },
    );
  }
}
