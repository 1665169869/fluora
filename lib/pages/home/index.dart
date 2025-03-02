import 'package:fluora/routes.dart';
import 'package:fluora/utils/permission_service.dart';
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
            leading: Icon(Icons.folder, size: 48),
            title: Text("内部存储"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {

              context.push(
                Uri(
                  path: '/${Routes.folder.path}',
                  queryParameters: {'path': 'test'},
                ).toString(),
              );
            },
          ),
        ],
      ),
    );
  }
}
