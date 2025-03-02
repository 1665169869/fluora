import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  /// 查询是否获取到存储权限
  /// @return 是否获取到权限
  static Future<bool> hasStoragePermission() async {
    if (Platform.isAndroid) {
      return await Permission.storage.isGranted;
    } else {
      assert(false, '暂时只支持安卓平台');
      return false;
    }
  }

  static Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      return await Permission.storage.request().isGranted;
    } else {
      assert(false, '暂时只支持安卓平台');
      return false;
    }
  }
}
