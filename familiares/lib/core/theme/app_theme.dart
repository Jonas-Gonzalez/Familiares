import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData appTheme({String? primaryColorHex}) {
  final primary = primaryColorHex != null
      ? Color(int.parse(primaryColorHex.replaceFirst('#', '0xFF')))
      : AppColors.primaryDefault;

  return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}