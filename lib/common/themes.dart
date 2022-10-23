import 'package:flutter/material.dart';

import 'package:chess/common/constants.dart' as constants;

final appTheme = ThemeData.dark().copyWith(
    tabBarTheme: const TabBarTheme(
  labelColor: constants.tabSelectedColor,
  labelStyle: TextStyle(color: constants.tabSelectedColor, fontSize: 18),
  unselectedLabelStyle:
      TextStyle(color: constants.tabNotSelectedColor, fontSize: 15),
  unselectedLabelColor: constants.tabNotSelectedColor,
  indicator: constants.roundedCornerDecoration,
));
