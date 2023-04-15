import 'dart:ffi';
import 'package:flutter/material.dart';
import 'calculator.dart';

void main() => runApp(
      MaterialApp(
        title: "MealShare Calculator",
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          appBarTheme: AppBarTheme(color: Color(0xFF0A0E21)),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        ),
        home: MSCalculator(),
      ),
    );
