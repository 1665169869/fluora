import 'dart:io';

import 'package:fluora/routes.dart';
import 'package:fluora/utils/folder/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FolderPage extends StatelessWidget {
  const FolderPage({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    final title = path;

    final Directory directory = Folder.getDirectory(path);
    final List<FileSystemEntity> dirList = directory.listSync();
    return Scaffold(
      appBar: AppBar(title: Text(path == Folder.root ? '内部存储' : title)),
      body: ListView.builder(
        itemCount: dirList.length,
        itemBuilder: (context, index) {
          final file = dirList[index];
          final bool isFile = FileSystemEntity.isFileSync(file.path);

          return ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Icon(
              isFile ? Icons.file_open : Icons.folder_open,
              size: 48,
            ),
            title: Text(file.path),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              print(path);
              if (!isFile) {
                context.push(
                  Uri(
                    path: '/${Routes.folder.path}',
                    queryParameters: {'path': file.path},
                  ).toString(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
