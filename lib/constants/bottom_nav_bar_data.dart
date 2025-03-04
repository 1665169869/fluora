/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-02 19:31:49
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-04 23:09:40
 * @FilePath: \fluora\lib\constants\bottom_nav_bar_data.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */
import 'package:flutter/material.dart';

class TabviewData {
  final String label;
  final Widget icon;

  TabviewData({required this.label, required this.icon});
}

List<TabviewData> get tabViewList => [
  TabviewData(label: "本地", icon: Icon(Icons.folder)),
  TabviewData(label: "云端", icon: Icon(Icons.cloud)),
  TabviewData(label: "播放列表", icon: Icon(Icons.list)),
  TabviewData(label: "下载队列", icon: Icon(Icons.download)),
];

List<NavigationDestination> get navigationDestinations =>
    tabViewList
        .map<NavigationDestination>(
          (item) => NavigationDestination(icon: item.icon, label: item.label),
        )
        .toList();
