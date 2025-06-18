import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme({Color? accent}) {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: accent ?? primaryColor,
            primary: accent ?? primaryColor,
            onPrimary: scaffoldBackgroundSecondaryColor,
            secondary: secondaryColor,
            onSecondary: whiteColor,
            tertiary: textBlack900,
            onTertiary: whiteColor,
            primaryContainer: primaryColor,
            onPrimaryContainer: whiteColor,
            error: redColor,
            onError: whiteColor,
            outline: accent ?? primaryColor),
        primaryColor: primaryColor,
        hintColor: textBlack600,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        useMaterial3: true,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: accent ?? primaryColor,
            foregroundColor: whiteColor,
            shadowColor: accent ?? primaryColor,
            minimumSize: const Size(double.infinity, 58),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: scaffoldBackgroundSecondaryColor,
          iconTheme: IconThemeData(color: blackColor),
          titleTextStyle: TextStyle(
              color: blackColor, fontSize: 24.0, fontWeight: FontWeight.w700),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: whiteColor,
          showSelectedLabels: false,
          selectedItemColor: secondaryColor,
        ),
        bottomSheetTheme: BottomSheetThemeData(
            dragHandleColor: textBlack600,
            dragHandleSize: const Size(100, 3),
            surfaceTintColor: whiteColor,
            backgroundColor: whiteColor,
            modalBackgroundColor: whiteColor),
        snackBarTheme: SnackBarThemeData(
            backgroundColor: accent ?? primaryColor,
            contentTextStyle: const TextStyle(
                color: whiteColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w700)),
        datePickerTheme: const DatePickerThemeData(
            headerHeadlineStyle: TextStyle(
                color: blackColor, fontSize: 22, fontWeight: FontWeight.w700),
            weekdayStyle: TextStyle(
                color: blackColor, fontSize: 14, fontWeight: FontWeight.w700),
            dayStyle: TextStyle(
                color: whiteColor, fontSize: 13, fontWeight: FontWeight.w700),
            inputDecorationTheme: InputDecorationTheme(),
            backgroundColor: whiteColor,
            surfaceTintColor: whiteColor),
        popupMenuTheme: const PopupMenuThemeData(
            color: whiteColor, surfaceTintColor: whiteColor),
        canvasColor: whiteColor,
        dividerColor: Colors.transparent,
        fontFamily: "Urbanist",
        textTheme: AppTextTheme.lightTextTheme());
  }

  static ThemeData darkTheme({Color? accent}) {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: accent ?? primaryColor,
            primary: accent ?? primaryColor,
            onPrimary: scaffoldBackgroundSecondaryColorDark,
            secondary: secondaryColor,
            onSecondary: whiteColor,
            tertiary: textBlack900,
            onTertiary: whiteColor,
            primaryContainer: primaryColor,
            onPrimaryContainer: whiteColor,
            error: redColor,
            onError: whiteColor,
            outline: accent ?? primaryColor),
        primaryColor: primaryColor,
        hintColor: textBlack600,
        scaffoldBackgroundColor: scaffoldBackgroundColorDark,
        useMaterial3: true,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: accent ?? primaryColor,
            foregroundColor: whiteColor,
            shadowColor: accent ?? primaryColor,
            minimumSize: const Size(double.infinity, 58),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: scaffoldBackgroundSecondaryColor,
          iconTheme: IconThemeData(color: blackColor),
          titleTextStyle: TextStyle(
              color: blackColor, fontSize: 24.0, fontWeight: FontWeight.w700),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: whiteColor,
          showSelectedLabels: false,
          selectedItemColor: secondaryColor,
        ),
        bottomSheetTheme: BottomSheetThemeData(
            dragHandleColor: textBlack600,
            dragHandleSize: const Size(100, 3),
            surfaceTintColor: whiteColor,
            backgroundColor: whiteColor,
            modalBackgroundColor: whiteColor),
        snackBarTheme: SnackBarThemeData(
            backgroundColor: accent ?? primaryColor,
            contentTextStyle: const TextStyle(
                color: whiteColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w700)),
        datePickerTheme: const DatePickerThemeData(
            headerHeadlineStyle: TextStyle(
                color: blackColor, fontSize: 22, fontWeight: FontWeight.w700),
            weekdayStyle: TextStyle(
                color: blackColor, fontSize: 14, fontWeight: FontWeight.w700),
            dayStyle: TextStyle(
                color: whiteColor, fontSize: 13, fontWeight: FontWeight.w700),
            inputDecorationTheme: InputDecorationTheme(),
            backgroundColor: whiteColor,
            surfaceTintColor: whiteColor),
        popupMenuTheme: const PopupMenuThemeData(
            color: whiteColor, surfaceTintColor: whiteColor),
        canvasColor: whiteColor,
        dividerColor: Colors.transparent,
        fontFamily: "Urbanist",
        textTheme: AppTextTheme.lightTextTheme());
  }
}

class AppTextTheme {
  static TextTheme lightTextTheme() {
    return const TextTheme(
      bodyLarge: TextStyle(
          color: textBlack700, fontSize: 16, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
          color: textBlack700, fontSize: 14, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          color: textBlack700, fontSize: 12, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          color: textBlack900, fontSize: 28, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: textBlack900, fontSize: 24, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(
          color: textBlack800, fontSize: 20, fontWeight: FontWeight.w700),
    );
  }

  static TextTheme darkTextTheme() {
    return const TextTheme(
      bodyLarge: TextStyle(
          color: whiteColor, fontSize: 16, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
          color: whiteColor, fontSize: 14, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          color: whiteColor, fontSize: 12, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          color: whiteColor, fontSize: 24, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: whiteColor, fontSize: 22, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(
          color: whiteColor, fontSize: 20, fontWeight: FontWeight.w700),
    );
  }
}