import 'package:fluora/entry/file_entry.dart';
import 'package:fluora/pages/folder/controllers/file_controller.dart';
import 'package:fluora/pages/home/index.dart';
import 'package:fluora/widgets/folder_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FolderView extends GetView<FileController> {
  const FolderView({super.key, this.currentPath = '', this.title = '本地'});
  final String currentPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    Get.put(FileController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadFiles(currentPath);
    });

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () async {
            await controller.loadFiles(currentPath);
          },
          child: FolderListView(currentPath: currentPath, controller: controller),
        );
      }),
    );
  }
}

class FolderListView extends StatelessWidget {
  const FolderListView({
    super.key,
    required this.currentPath,
    required this.controller,
  });

  final String currentPath;
  final FileController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currentPath == '' ? 1 : controller.files.length,
      itemBuilder: (context, index) {
        late FileEntry entry;

        if (currentPath == '') {
          entry = FileEntry(name: '内部存储', path: '/', isDirectory: true);
        } else {
          entry = controller.files[index];
        }

        return FolderTile(
          onTap:
              () => Get.to(
                FolderView(currentPath: entry.path, title: entry.name),
                id: Get.find<HomeController>().currentNavigatorKey,
              ),
          data: entry,
        );
      },
    );
  }
}
