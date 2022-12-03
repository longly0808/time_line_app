import 'package:flutter/material.dart';

import '../style/style.dart';

extension ThemeExtensions on ThemeData{
  List<List<Color>> dotLoadingColor({bool? isLightMode, Color? color}) {
    final isLight = isLightMode ?? MyTheme.isLightMode;

    return isLight ? MyColors.dotLoadingColor : MyColors.dotLoadingColor;
  }
}