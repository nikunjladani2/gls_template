import 'package:flutter/material.dart';
import 'package:gls_template/common/constant/key_constant.dart';
import 'package:gls_template/view/common/app_colors.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

class AppTheme {
  static load({bool flagDarkTheme = true}) {
    TextTheme textTheme = _deriveTextTheme();
    TGView.loadTheme(flagDarkTheme
        ? _createDarkTheme(textTheme)
        : _createLightTheme(textTheme));
  }

  static TextTheme _deriveTextTheme() {
    String? textTheme = TGSession.getInstance().get(SessionKey.keyTextSize);
    switch (textTheme) {
      case "S":
        return _textThemeSmall;
      case "R":
        return _textThemeRegular;
      case "L":
        return _textThemeLarge;
    }
    return _textThemeRegular;
  }

  static ThemeData _createDarkTheme(TextTheme _textTheme) {
    return ThemeData(
        brightness: Brightness.dark,
        canvasColor: ThemeColors.primary[600],
        backgroundColor: ThemeColors.primary[600],
        dialogBackgroundColor: ThemeColors.primary[600],
        scaffoldBackgroundColor: ThemeColors.primary[800],
        primarySwatch: ThemeColors.primary,
        primaryColor: ThemeColors.primary,
        primaryColorLight: ThemeColors.primary,
        primaryColorDark: ThemeColors.primary,
        secondaryHeaderColor: ThemeColors.darkGrey[700],
        indicatorColor: ThemeColors.accent,
        toggleableActiveColor: ThemeColors.accent,
        errorColor: redColor,
        hintColor: ThemeColors.hint,
        highlightColor: ThemeColors.hint,
        splashColor: ThemeColors.darkGrey[600],
        dividerColor: ThemeColors.grey[400],
        disabledColor: ThemeColors.darkGrey[300],
        bottomAppBarColor: ThemeColors.darkGrey[800],
        cardColor: ThemeColors.darkGrey[800],
        focusColor: Colors.white.withOpacity(0.12),
        hoverColor: Colors.white.withOpacity(0.04),
        selectedRowColor: ThemeColors.darkGrey[100],
        unselectedWidgetColor: Colors.white70,
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ThemeColors.accent[600]),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        )),
        textTheme: _textTheme.apply(
          bodyColor: ThemeColors.grey[100],
          displayColor: ThemeColors.grey[300],
        ));
  }

  static ThemeData _createLightTheme(TextTheme _textTheme) {
    return ThemeData(
        textSelectionTheme:
        const TextSelectionThemeData(selectionHandleColor: primaryColor),
        brightness: Brightness.light,
        canvasColor: Colors.white,
        backgroundColor: ThemeColors.primary[200],
        dialogBackgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: ThemeColors.primary,
        primaryColor: ThemeColors.primary,
        primaryColorLight: ThemeColors.primary[300],
        primaryColorDark: ThemeColors.primary[700],
        secondaryHeaderColor: ThemeColors.primary[50],
        indicatorColor: Colors.white,
        toggleableActiveColor: Colors.white,
        errorColor: redColor,
        hintColor: ThemeColors.hint,
        highlightColor: Colors.transparent, //ThemeColors.hint,
        splashColor: ThemeColors.lightGrey[50],
        dividerColor: ThemeColors.lightGrey[200],
        disabledColor: ThemeColors.lightGrey[500],
        bottomAppBarColor: Colors.white,
        cardColor: Colors.white,
        focusColor: Colors.black.withOpacity(0.12),
        hoverColor: Colors.black.withOpacity(0.04),
        selectedRowColor: ThemeColors.grey[100],
        unselectedWidgetColor: Colors.black54,
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        )),
        textTheme: _textTheme.apply(
          bodyColor: ThemeColors.grey[900],
          displayColor: ThemeColors.grey[500],
        ));
  }

  static const TextTheme _textThemeSmall = TextTheme(
    headline1: TextStyle(
        fontSize: 72.0, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: TextStyle(
        fontSize: 52.0, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: TextStyle(
        fontSize: 40.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    headline4: TextStyle(
        fontSize: 28.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    headline5: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    headline6: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle2: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.normal, letterSpacing: 0.5),
    bodyText2: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    button: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.w500, letterSpacing: 1.0),
    caption: TextStyle(
        fontSize: 10.0, fontWeight: FontWeight.normal, letterSpacing: 0.4),
    overline: TextStyle(
        fontSize: 8.0, fontWeight: FontWeight.normal, letterSpacing: 1.5),
  );

  static const TextTheme _textThemeRegular = TextTheme(
    headline1: TextStyle(
        fontSize: 96.0, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: TextStyle(
        fontSize: 60.0, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: TextStyle(
        fontSize: 48.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    headline4: TextStyle(
        fontSize: 34.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    headline5: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    headline6: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle2: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.normal, letterSpacing: 0.5),
    bodyText2: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    button: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 1.0),
    caption: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, letterSpacing: 0.4),
    overline: TextStyle(
        fontSize: 10.0, fontWeight: FontWeight.normal, letterSpacing: 1.5),
  );

  static const TextTheme _textThemeLarge = TextTheme(
    headline1: TextStyle(
        fontSize: 112.0, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: TextStyle(
        fontSize: 72.0, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: TextStyle(
        fontSize: 58.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    headline4: TextStyle(
        fontSize: 40.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    headline5: TextStyle(
        fontSize: 28.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    headline6: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle2: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.normal, letterSpacing: 0.5),
    bodyText2: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    button: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 1.0),
    caption: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.normal, letterSpacing: 0.4),
    overline: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, letterSpacing: 1.5),
  );
}

class ThemeColors {
  ThemeColors._();

  static const MaterialColor primary = MaterialColor(
    0xFF1864AD,
    <int, Color>{
      50: Color(0xFFE3ECF5),
      100: Color(0xFFBAD1E6),
      200: Color(0xFF8CB2D6),
      300: Color(0xFF5D93C6),
      400: Color(0xFF3B7BB9),
      500: Color(0xFF1864AD),
      600: Color(0xFF155CA6),
      700: Color(0xFF11529C),
      800: Color(0xFF0E4893),
      900: Color(0xFF083683),
    },
  );

  static const MaterialColor accent = MaterialColor(
    0xFF7CC242,
    <int, Color>{
      50: Color(0xFFEFF8E8),
      100: Color(0xFFD8EDC6),
      200: Color(0xFFBEE1A1),
      300: Color(0xFFA3D47B),
      400: Color(0xFF90CB5E),
      500: Color(0xFF7CC242),
      600: Color(0xFF74BC3C),
      700: Color(0xFF69B433),
      800: Color(0xFF5FAC2B),
      900: Color(0xFF4C9F1D),
    },
  );

  static const MaterialColor hint = MaterialColor(
    0xFFFF9E12,
    <int, Color>{
      50: Color(0xFFFFF3E3),
      100: Color(0xFFFFE2B8),
      200: Color(0xFFFFCF89),
      300: Color(0xFFFFBB59),
      400: Color(0xFFFFAD36),
      500: Color(0xFFFF9E12),
      600: Color(0xFFFF9610),
      700: Color(0xFFFF8C0D),
      800: Color(0xFFFF820A),
      900: Color(0xFFFF7005),
    },
  );

  static const MaterialColor darkGrey = MaterialColor(
    0xFF323232,
    <int, Color>{
      50: Color(0xFFE6E6E6),
      100: Color(0xFFC2C2C2),
      200: Color(0xFF999999),
      300: Color(0xFF707070),
      400: Color(0xFF515151),
      500: Color(0xFF323232),
      600: Color(0xFF2D2D2D),
      700: Color(0xFF262626),
      800: Color(0xFF1F1F1F),
      900: Color(0xFF131313),
    },
  );

  static MaterialColor grey = const MaterialColor(
    0xFF646464,
    <int, Color>{
      50: Color(0xFFECECEC),
      100: Color(0xFFD1D1D1),
      200: Color(0xFFB2B2B2),
      300: Color(0xFF939393),
      400: Color(0xFF7B7B7B),
      500: Color(0xFF646464),
      600: Color(0xFF5C5C5C),
      700: Color(0xFF525252),
      800: Color(0xFF484848),
      900: Color(0xFF363636),
    },
  );

  static MaterialColor lightGrey = const MaterialColor(
    0xFF969696,
    <int, Color>{
      50: Color(0xFFF2F2F2),
      100: Color(0xFFE0E0E0),
      200: Color(0xFFCBCBCB),
      300: Color(0xFFB6B6B6),
      400: Color(0xFFA6A6A6),
      500: Color(0xFF969696),
      600: Color(0xFF8E8E8E),
      700: Color(0xFF838383),
      800: Color(0xFF797979),
      900: Color(0xFF686868),
    },
  );
}
