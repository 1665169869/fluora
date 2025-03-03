/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-02 19:31:49
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-04 00:54:57
 * @FilePath: \fluora\lib\pages\home\folder\index.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */
/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-02 19:31:49
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-04 00:07:14
 * @FilePath: \fluora\lib\pages\home\folder\index.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */

import 'package:fluora/pages/home/folder/folder_data.dart';
import 'package:fluora/pages/home/folder/loadding_widget.dart';
import 'package:fluora/pages/home/folder/success_widget.dart';
import 'package:fluora/utils/folder/index.dart';
import 'package:flutter/material.dart';

class FolderPage extends StatelessWidget {
  const FolderPage({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(path == Folder.root ? '内部存储' : Folder.getPathName(path)),
      ),
      body: FutureBuilder(
        future: floderData(path),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              return SuccessWidget(data: snapshot.data);
            }
          } else {
            // 请求未结束，显示loading
            return LoaddingWidget();
          }
        },
      ),
    );
  }
}
