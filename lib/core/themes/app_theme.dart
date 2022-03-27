import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class AppTheme {
  final BuildContext ctx;
  AppTheme(this.ctx);

  ThemeData get light {
    final TextTheme textTheme = Theme.of(ctx).textTheme.apply(
          bodyColor: ColorConst.black,
          displayColor: ColorConst.black,
          decorationColor: ColorConst.black,
        );

    return ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,

      /// Colors
      textTheme: GoogleFonts.notoSansTextTheme(textTheme),
      iconTheme: IconThemeData(color: ColorConst.black),
      canvasColor: Colors.white,
      colorScheme: ColorScheme.light(
        primary: ColorConst.primary,
        secondary: Colors.grey.shade300,
      ),
      primaryColor: ColorConst.primary,

      //transtitions
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder()
      }),

      /// AppBar
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        // elevation: 0,
        iconTheme: IconThemeData(color: ColorConst.primary),
      ),

      /// Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 1,
          side: const BorderSide(color: ColorConst.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ).copyWith(
          elevation: MaterialStateProperty.resolveWith<double?>(
            (states) => states.contains(MaterialState.hovered) ? 4 : 2,
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) => states.contains(MaterialState.hovered)
                ? ColorConst.primary
                : Colors.white,
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) => states.contains(MaterialState.hovered)
                ? Colors.white
                : ColorConst.primary,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        alignLabelWithHint: true,
        filled: true,
        fillColor: Colors.white,
        errorMaxLines: 1,
        // isDense: true,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorConst.primary, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        isCollapsed: false,
        labelStyle: TextStyle(color: ColorConst.black),
        helperMaxLines: 2,
      ),
    );
  }
}
