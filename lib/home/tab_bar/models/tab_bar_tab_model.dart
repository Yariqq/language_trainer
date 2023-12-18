import 'package:flutter/material.dart';

abstract class TabBarTabModel {
  String get iconPath;

  String title(BuildContext context);
}
