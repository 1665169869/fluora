/*
 * @Author: 白羽 1665169869@qq.com
 * @Date: 2025-03-04 00:54:06
 * @LastEditors: 白羽 1665169869@qq.com
 * @LastEditTime: 2025-03-04 00:54:09
 * @FilePath: \fluora\lib\pages\home\folder\loadding_widget.dart
 * @Description:
 * Copyright (c) 2025 by 白羽 1665169869@qq.com, All Rights Reserved.
 */
import 'package:flutter/material.dart';

class LoaddingWidget extends StatelessWidget {
  const LoaddingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
