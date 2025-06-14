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
        // cardTheme: CardTheme(
        //     margin: EdgeInsets.zero,
        //     color: whiteColor,
        //     elevation: 0.0,
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(10.0))),
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

  // static ThemeData darkTheme({bool isMidnight = true, Color? accent}) {
  //   return ThemeData(
  //       colorScheme: ColorScheme.fromSeed(
  //           brightness: Brightness.dark,
  //           seedColor: primaryColor,
  //           primary: accent ?? primaryColor,
  //           onPrimary: isMidnight ? whiteColorMidnight : (kIsWeb ? backgroundColorDark : whiteColorDark),
  //           secondary: secondaryColor,
  //           onSecondary: isMidnight ? whiteColorMidnight : whiteColorDark,
  //           tertiary: whiteColor,
  //           onTertiary: isMidnight ? whiteColorMidnight : whiteColorDark,
  //           background:
  //           isMidnight ? backgroundColorMidnight : backgroundColorDark,
  //           onBackground: whiteColor,
  //           error: redColor,
  //           onError: whiteColor,
  //           outline: accent ?? primaryColor),
  //       primaryColor: primaryColor,
  //       scaffoldBackgroundColor:
  //       isMidnight ? backgroundColorMidnight : (kIsWeb ? whiteColorDark : backgroundColorDark),
  //       hintColor: whiteColor.withOpacity(0.2),
  //       // primaryColor: primaryColor,
  //       useMaterial3: true,
  //       appBarTheme: AppBarTheme(
  //         backgroundColor: accent ?? primaryColor,
  //         iconTheme: const IconThemeData(color: whiteColor),
  //         titleTextStyle: const TextStyle(
  //             color: whiteColor, fontSize: 24.0, fontWeight: FontWeight.w700),
  //       ),
  //       cardTheme: CardTheme(
  //           margin: EdgeInsets.zero,
  //           color: whiteColor,
  //           elevation: 0.0,
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10.0))),
  //       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //         backgroundColor: whiteColor,
  //         showSelectedLabels: false,
  //         unselectedItemColor: inactiveColor,
  //         selectedItemColor: secondaryColor,
  //       ),
  //       datePickerTheme: DatePickerThemeData(
  //         headerHeadlineStyle: const TextStyle(
  //             color: whiteColor, fontSize: 22, fontWeight: FontWeight.w700),
  //         weekdayStyle: const TextStyle(
  //             color: whiteColor, fontSize: 14, fontWeight: FontWeight.w700),
  //         dayStyle: const TextStyle(
  //             color: whiteColor, fontSize: 13, fontWeight: FontWeight.w700),
  //         inputDecorationTheme: const InputDecorationTheme(),
  //         backgroundColor: isMidnight ? dialogBgMidnight : dialogBgDark,
  //         surfaceTintColor: isMidnight ? dialogBgMidnight : dialogBgDark,
  //       ),
  //       canvasColor: isMidnight ? whiteColorMidnight : whiteColorDark,
  //       bottomSheetTheme: BottomSheetThemeData(
  //         dragHandleColor: whiteColor,
  //         dragHandleSize: const Size(70, 3),
  //         surfaceTintColor:
  //         isMidnight ? whiteColorMidnightFaded : whiteColorDarkFaded,
  //         backgroundColor:
  //         isMidnight ? whiteColorMidnightFaded : whiteColorDarkFaded,
  //         modalBackgroundColor:
  //         isMidnight ? whiteColorMidnightFaded : whiteColorDarkFaded,
  //       ),
  //       snackBarTheme: SnackBarThemeData(
  //           backgroundColor: accent ?? primaryColor,
  //           contentTextStyle: const TextStyle(
  //               color: whiteColor,
  //               fontSize: 14.0,
  //               fontWeight: FontWeight.w700)),
  //       popupMenuTheme: PopupMenuThemeData(
  //           color: isMidnight ? whiteColorMidnightFaded : whiteColorDarkFaded,
  //           surfaceTintColor:
  //           isMidnight ? whiteColorMidnightFaded : whiteColorDarkFaded),
  //       dividerColor: Colors.transparent,
  //       fontFamily: "Helvetica",
  //       textTheme: AppTextTheme.darkTextTheme());
  // }
}

class AppTextTheme {
  static TextTheme lightTextTheme() {
    return const TextTheme(
      bodyLarge: TextStyle(
          color: textBlack700, fontSize: 18, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
          color: textBlack700, fontSize: 14, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          color: textBlack700, fontSize: 12, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          color: primaryColor, fontSize: 24, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: primaryColor, fontSize: 22, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(
          color: textBlack800, fontSize: 20, fontWeight: FontWeight.w700),
    );
  }

  static TextTheme darkTextTheme() {
    return const TextTheme(
      bodyLarge: TextStyle(
          color: whiteColor, fontSize: 18, fontWeight: FontWeight.w600),
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