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
  var _num_of_people1 = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var _num_of_people2 = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var _num_of_people3 = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var _num_of_people4 = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int? _selectedValue1;
  int? _selectedValue2;
  int? _selectedValue3;
  int? _selectedValue4;
  String _displayText = ''; // define the _displayText variable

  TextEditingController textBox1 = TextEditingController();
  TextEditingController textBox2 = TextEditingController();
  TextEditingController textBox3 = TextEditingController();
  TextEditingController textBox4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
        appBar: AppBar(
          title: Text("MealShare Calculator"),
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: ListView(
            children: <Widget>[
              Container(height: 100),
              // Row containing DropdownButton and TextField
              Row(
                children: [
                  // Expanded widget for TextField
                  Expanded(
                    child: TextField(
                      controller: textBox1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Dish 1",
                        hintText: "Amount of money",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  // Expanded widget for DropdownButton
                  Expanded(
                    child: DropdownButton<int>(
                      key:
                          UniqueKey(), // add a unique key to differentiate this DropdownButton from others
                      value: _selectedValue1,
                      items: _num_of_people1.map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (int? value) {
                        setState(() {
                          _selectedValue1 = value;
                        });
                        print("Value changed to $_selectedValue1");
                      },
                    ),
                  ),
                ],
              ),
              Container(height: 20),
              Row(
                children: [
                  // Expanded widget for TextField
                  Expanded(
                    child: TextField(
                      controller: textBox2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Dish 2",
                        hintText: "Amount of money",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  // Expanded widget for DropdownButton
                  Expanded(
                    child: DropdownButton<int>(
                      key:
                          UniqueKey(), // add a unique key to differentiate this DropdownButton from others
                      value: _selectedValue2,
                      items: _num_of_people2.map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (int? value) {
                        setState(() {
                          _selectedValue2 = value;
                        });
                        print("Value changed to $_selectedValue2");
                      },
                    ),
                  ),
                ],
              ),
              Container(height: 20),
              Row(
                children: [
                  // Expanded widget for TextField
                  Expanded(
                    child: TextField(
                      controller: textBox3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Dish 3",
                        hintText: "Amount of money",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  // Expanded widget for DropdownButton
                  Expanded(
                    child: DropdownButton<int>(
                      key:
                          UniqueKey(), // add a unique key to differentiate this DropdownButton from others
                      value: _selectedValue3,
                      items: _num_of_people3.map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (int? value) {
                        setState(() {
                          _selectedValue3 = value;
                        });
                        print("Value changed to $_selectedValue3");
                      },
                    ),
                  ),
                ],
              ),
              Container(height: 20),
              Row(
                children: [
                  // Expanded widget for TextField
                  Expanded(
                    child: TextField(
                      controller: textBox4,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Dish 4",
                        hintText: "Amount of money",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  // Expanded widget for DropdownButton
                  Expanded(
                    child: DropdownButton<int>(
                      key:
                          UniqueKey(), // add a unique key to differentiate this DropdownButton from others
                      value: _selectedValue4,
                      items: _num_of_people4.map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (int? value) {
                        setState(() {
                          _selectedValue4 = value;
                        });
                        print("Value changed to $_selectedValue4");
                      },
                    ),
                  ),
                ],
              ),
              Text(
                _displayText,
                style: TextStyle(fontSize: 12),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: ElevatedButton(
                          child: Text("Calculate"),
                          onPressed: () {
                            setState(() {
                              double first = double.parse(textBox1.text) /
                                  (_selectedValue1 ?? 1);
                              double second = double.parse(textBox2.text) /
                                  (_selectedValue2 ?? 1);
                              double third = double.parse(textBox3.text) /
                                  (_selectedValue3 ?? 1);
                              double fourth = double.parse(textBox4.text) /
                                  (_selectedValue4 ?? 1);
                              _displayText =
                                  "You have to pay £${(first + second + third + fourth) * 1.125} with 12.5% service charge";
                            });
                          })),
                  Expanded(
                      child: ElevatedButton(
                          child: Text("Clear"),
                          onPressed: () {
                            setState(() {
                              _clearAll();
                            });
                          }))
                ],
              )
            ],
          ),
        ));
  }

  void _clearAll() {
    textBox1.text = "";
    textBox2.text = "";
    textBox3.text = "";
    textBox4.text = "";
    _selectedValue1 = 1;
    _selectedValue2 = 1;
    _selectedValue3 = 1;
    _selectedValue4 = 1;
    _displayText = "";
  }
}
