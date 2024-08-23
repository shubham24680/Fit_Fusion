import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';

theme() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: background,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: yellow,
      selectionColor: yellow.withOpacity(0.5),
      selectionHandleColor: yellow,
    ),
    appBarTheme: const AppBarTheme(
      toolbarHeight: 90,
    )
  );
}