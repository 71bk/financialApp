import 'package:flutter/material.dart';

ThemeData buildTheme(Brightness brightness) {
  final scheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF00696D),
    brightness: brightness,
  );
  return ThemeData(colorScheme: scheme);
}
