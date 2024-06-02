import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        cardColor: Colors.white,
        canvasColor: creamColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          // textTheme: Theme.of(context).textTheme,
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(secondary: Colors.deepPurple),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          // textTheme: Theme.of(context).textTheme.copyWith(
          //       headline6:
          //           context.TextStyle.headline6.copyWith(color: Colors.white),
          //     ),
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
  static Color darkCreamColor = Colors.grey;
  static Color lightBluishColor = Colors.grey;
}



class RiveAppTheme {
  static const Color accentColor = Color(0xFF5E9EFF);
  static const Color shadow = Color(0xFF4A5367);
  static const Color shadowDark = Color(0xFF000000);
  static const Color background = Color(0xFFF2F6FF);
  static const Color backgroundDark = Color(0xFF25254B);
  static const Color background2 = Color(0xFF17203A);
}