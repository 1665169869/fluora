import 'package:fluora/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        destinations: navigationDestinations,
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (value) => _onItemTapped(context, value),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location == Routes.home.path) {
      return 0;
    } else if (location == Routes.clouds.path) {
      return 1;
    } else if (location == Routes.playlists.path) {
      return 2;
    } else if (location == Routes.downloads.path) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(BuildContext ctx, int index) {
    switch (index) {
      case 0:
        ctx.go(Routes.home.path);
        break;
      case 1:
        ctx.go(Routes.clouds.path);
        break;
      case 2:
        ctx.go(Routes.playlists.path);
        break;
      case 3:
        ctx.go(Routes.downloads.path);
      default:
        assert(false, 'Unknown tab index');
        ctx.go(Routes.home.path);
    }
  }
}

class TabviewData {
  final String label;
  final Widget icon;

  TabviewData({required this.label, required this.icon});
}

List<TabviewData> tabViewList = [
  TabviewData(label: "本地", icon: Icon(Icons.folder)),
  TabviewData(label: "网络", icon: Icon(Icons.cloud)),
  TabviewData(label: "播放列表", icon: Icon(Icons.list)),
  TabviewData(label: "下载", icon: Icon(Icons.download)),
];

List<NavigationDestination> navigationDestinations =
    tabViewList
        .map<NavigationDestination>(
          (item) => NavigationDestination(icon: item.icon, label: item.label),
        )
        .toList();
