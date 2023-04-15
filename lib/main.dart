import 'dart:ffi';
import 'package:flutter/material.dart';
import 'calculator.dart';

void main() => runApp(
      MaterialApp(
        title: "MealShare Calculator",
        theme: ThemeData(appBarTheme: AppBarTheme(color: Color(0xFF1e7ca7))),
        home: MSCalculator(),
      ),
    );
