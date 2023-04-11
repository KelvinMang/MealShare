import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: "MealShare Calculator",
        theme: ThemeData(primaryColor: Colors.indigoAccent),
        home: MSCalculator(),
      ),
    );

class MSCalculator extends StatefulWidget {
  const MSCalculator({Key? key}) : super(key: key);

  @override
  State<MSCalculator> createState() => _MSCalculatorState();
}

class _MSCalculatorState extends State<MSCalculator> {
  var _operation = ['Add', 'Subtract', 'Multiply', 'Divide'];
  var _num_of_people = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MealShare Calculator"),
        ),
        body: ListView(
          children: <Widget>[
            DropdownButton<String>(
              items: _operation.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                print("Value changed to $value");
              },
            ),
            // DropdownButton to indicate the number of people
            DropdownButton<int>(
              items: _num_of_people.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (int? value) {
                if (value != null) {
                  print("Value changed to $value");
                }
              },
            ),
          ],
        ));
  }
}
