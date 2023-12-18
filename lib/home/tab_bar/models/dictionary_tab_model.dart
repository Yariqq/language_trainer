import 'package:flutter/material.dart';
import 'package:seven/app/theme/icons_path.dart';
import 'package:seven/home/tab_bar/models/tab_bar_tab_model.dart';

class DictionaryTabModel extends TabBarTabModel {
  @override
  String get iconPath => IconsPath.icFamily;

  @override
  String title(BuildContext context) {
    return 'Dictionary';
  }
}
