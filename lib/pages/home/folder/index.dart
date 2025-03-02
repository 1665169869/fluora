import 'package:fluora/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FolderPage extends StatelessWidget {
  const FolderPage({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    final title = path;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Icon(Icons.folder, size: 48),
            title: Text("内部存储"),
            trailing: Icon(Icons.navigate_next),
            onTap:
                () => context.push(
                  Uri(
                    path: '/${Routes.folder.path}',
                    queryParameters: {'path': 'test'},
                  ).toString(),
                ),
          ),
        ],
      ),
    );
  }
}
