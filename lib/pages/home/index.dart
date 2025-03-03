/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-02 19:31:49
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-02 21:57:29
 * @FilePath: \fluora\lib\pages\home\index.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */

import 'package:fluora/routes.dart';
import 'package:fluora/utils/folder/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Icon(Icons.folder_open, size: 48),
            title: Text("内部存储"),
            trailing: Icon(Icons.navigate_next),
            onTap: () async {
              context.push(
                Uri(
                  path: '/${Routes.folder.path}',
                  queryParameters: {'path': Folder.root},
                ).toString(),
              );
            },
          ),
        ],
      ),
    );
  }
}
