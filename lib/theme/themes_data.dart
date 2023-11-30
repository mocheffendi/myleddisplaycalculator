import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

// class ThemeClass {
//   Color lightPrimaryColor = HexColor('#DF0054');
//   Color darkPrimaryColor = HexColor('#480032');
//   Color secondaryColor = HexColor('#FF886A');
//   Color accentColor = HexColor('#FFD2BB');

//   static ThemeData lightTheme = ThemeData(
//     primaryColor: ThemeData.light().scaffoldBackgroundColor,
//     colorScheme: const ColorScheme.light().copyWith(
//         primary: _themeClass.lightPrimaryColor,
//         secondary: _themeClass.secondaryColor),
//   );
//   static ThemeData darkTheme = ThemeData(
//       primaryColor: _themeClass.lightPrimaryColor,
//       floatingActionButtonTheme:
//           const FloatingActionButtonThemeData(backgroundColor: Colors.amber),
//       colorScheme: const ColorScheme.dark()
//           .copyWith(primary: _themeClass.darkPrimaryColor));
// }

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.blueGrey.shade400,
    primary: Colors.blueGrey.shade300,
    secondary: Colors.blueGrey.shade200,
    tertiary: Colors.blueGrey.shade900,
    surface: Colors.blueGrey.shade100,
  ),
  appBarTheme: AppBarTheme(
    foregroundColor: Colors.grey.shade200,
    backgroundColor: Colors.amber.shade900,
  ),
  scaffoldBackgroundColor: Colors.blueGrey.shade50,
  // canvasColor: Colors.blueGrey.shade900,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(foregroundColor: Colors.grey.shade800)),
  // iconButtonTheme: IconButtonThemeData(),
  // splashColor: Colors.transparent,
  // highlightColor: Colors.transparent,
  // hoverColor: Colors.transparent,

  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.grey.shade800),
    bodyMedium: TextStyle(color: Colors.grey.shade800),
    bodySmall: TextStyle(color: Colors.grey.shade800),
    labelLarge: TextStyle(color: Colors.grey.shade800),
    labelMedium: TextStyle(color: Colors.grey.shade800),
    labelSmall: TextStyle(color: Colors.grey.shade800),
  ),

  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey.shade200,
    labelStyle: TextStyle(
      color: Colors.grey.shade900,
    ),
    floatingLabelStyle: TextStyle(
      color: Colors.grey.shade900,
    ),
    prefixIconColor: Colors.amber.shade900,
  ),

  iconTheme: IconThemeData(
    color: Colors.grey.shade800,
  ),

  floatingActionButtonTheme:
      FloatingActionButtonThemeData(foregroundColor: Colors.grey.shade800),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.blueGrey.shade900,
    primary: Colors.blueGrey.shade800,
    secondary: Colors.blueGrey.shade700,
    surface: Colors.blueGrey.shade800,
    tertiary: Colors.blueGrey.shade100,
    primaryContainer: Colors.blueGrey.shade800,
  ),
  appBarTheme: AppBarTheme(
    foregroundColor: Colors.grey.shade200,
    backgroundColor: Colors.amber.shade900,
  ),
  scaffoldBackgroundColor: Colors.blueGrey.shade900,
  // canvasColor: Colors.blueGrey.shade100,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(foregroundColor: Colors.grey.shade200)),
  // splashColor: Colors.transparent,
  // highlightColor: Colors.transparent,
  // hoverColor: Colors.transparent,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.grey.shade200),
    bodyMedium: TextStyle(color: Colors.grey.shade200),
    bodySmall: TextStyle(color: Colors.grey.shade200),
    labelLarge: TextStyle(color: Colors.grey.shade200),
    labelMedium: TextStyle(color: Colors.grey.shade200),
    labelSmall: TextStyle(color: Colors.grey.shade200),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey.shade800,
    floatingLabelStyle: TextStyle(
      color: Colors.grey.shade200,
    ),
    prefixIconColor: Colors.amber.shade900,

    // fillColor: Colors.white, // Background color of the input field
  ),

  iconTheme: IconThemeData(
    color: Colors.grey.shade200,
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(foregroundColor: Colors.grey.shade200),
);
