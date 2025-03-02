import 'package:fluora/page_context.dart';
import 'package:fluora/pages/folder/index.dart';
import 'package:fluora/pages/home/index.dart';
import 'package:fluora/pages/not_found.dart';
import 'package:fluora/pages/scaffold_with_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutesData {
  final String path;
  final String? name;

  RoutesData({required this.path, this.name});
}

class Routes {
  static final RoutesData home = RoutesData(path: "/", name: "folder");
  static final RoutesData clouds = RoutesData(path: "/clouds", name: "cloud");
  static final RoutesData playlists = RoutesData(
    path: "/playlists",
    name: "playlists",
  );
  static final RoutesData downloads = RoutesData(
    path: "/downloads",
    name: "downloads",
  );

  // NOTE: Don't need to specify "/" character for router’s parents
  static final RoutesData folder = RoutesData(path: 'folders', name: 'folders');

  static GoRouter router = GoRouter(
    initialLocation: '/',
    // errorBuilder: (context, state) => NotFound(),
    routes: [
      ShellRoute(
        builder: (ctx, state, Widget child) => ScaffoldWithNavbar(child: child),
        routes: [
          _folderRoute(),
          _cloudRoute(),
          _palylistsRoute(),
          _downloadsRoute(),
        ],
      ),
    ],
  );

  static GoRoute _downloadsRoute() {
    return GoRoute(
          path: downloads.path,
          name: downloads.name,
          builder: (context, state) => PageContext(title: "下载"),
        );
  }

  static GoRoute _palylistsRoute() {
    return GoRoute(
          path: playlists.path,
          name: playlists.name,
          builder: (context, state) => PageContext(title: "播放列表"),
        );
  }

  static GoRoute _cloudRoute() {
    return GoRoute(
          path: clouds.path,
          name: clouds.name,
          builder: (context, state) => PageContext(title: "网络"),
        );
  }

  static GoRoute _folderRoute() {
    return GoRoute(
          path: home.path,
          name: home.name,
          builder: (context, state) => HomePage(title: '本地'),

          routes: [
            GoRoute(
              path: folder.path,
              name: folder.name,
              builder: (context, state) {
                final String? path = state.uri.queryParameters['path'];
                if (path == null || path.isEmpty) {
                  return NotFound();
                }
                return FolderPage(title: path);
              },
            ),
          ],
        );
  }
}
