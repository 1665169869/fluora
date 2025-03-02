import 'package:fluora/routes.dart';
import 'package:fluora/theme/light.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'fluora',
      theme: lightTheme,
      routerConfig: Routes.router,
    );
  }
}
