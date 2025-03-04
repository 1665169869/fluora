import 'package:flutter/material.dart';

class FolderView extends StatelessWidget {
  const FolderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("本地")),
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(Duration(seconds: 1), () => true),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Icon(Icons.folder, size: 48),
              title: Text("内部存储"),
              trailing: Icon(Icons.navigate_next, size: 28),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
