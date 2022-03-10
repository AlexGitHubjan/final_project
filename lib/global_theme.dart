import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
      splashColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ).copyWith(secondary: Colors.black),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline5: TextStyle(
            fontSize: 20.0, color: Colors.white,),
        bodyText1: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Umbrella'),
        bodyText2: TextStyle(
            fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
