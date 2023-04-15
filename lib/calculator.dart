import 'package:flutter/material.dart';

class MSCalculator extends StatefulWidget {
  const MSCalculator({Key? key}) : super(key: key);

  @override
  State<MSCalculator> createState() => _MSCalculatorState();
}

class RowData {
  TextEditingController textBox = TextEditingController();
  int? selectedValue = 1;
  List<int> numOfPeople = [1, 2, 3, 4, 5, 6, 7, 8, 9];
}

class FeeBox extends StatelessWidget {
  const FeeBox({
    Key? key,
    required this.textBox,
    required this.labelText,
  }) : super(key: key);

  final TextEditingController textBox;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: textBox,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: "Amount of money",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}

class _MSCalculatorState extends State<MSCalculator> {
  List<RowData> rowData = [RowData()]; // List to store data for each row
  String _displayText = '';

  // Method to add a new row
  void addRow() {
    setState(() {
      rowData.add(RowData());
    });
  }

  var _num_of_people1 = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var _num_of_people2 = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var _num_of_people3 = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var _num_of_people4 = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int? _selectedValue1;
  int? _selectedValue2;
  int? _selectedValue3;
  int? _selectedValue4;

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
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: rowData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        // Expanded widget for TextField
                        Expanded(
                          child: FeeBox(
                            textBox: rowData[index].textBox,
                            labelText: "Dish ${index + 1}",
                          ),
                        ),
                        // Expanded widget for DropdownButton
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.only(bottom: 20),
                            child: DropdownButton<int>(
                              value: rowData[index].selectedValue,
                              items:
                                  rowData[index].numOfPeople.map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                              onChanged: (int? value) {
                                setState(() {
                                  rowData[index].selectedValue = value;
                                });
                                print(
                                    "Value changed to ${rowData[index].selectedValue}");
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Text(
                _displayText,
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text("Add Dishes"),
                      onPressed: addRow,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: ElevatedButton(
                          child: Text("Calculate"),
                          onPressed: () {
                            setState(() {
                              double total = 0;
                              for (var row in rowData) {
                                total += double.parse(row.textBox.text) /
                                    (row.selectedValue ?? 1);
                              }
                              _displayText =
                                  "You have to pay £${total * 1.125} with 12.5% service charge";
                            });
                          })),
                  Expanded(
                      child: ElevatedButton(
                          child: Text("Clear"),
                          onPressed: () {
                            setState(() {
                              rowData = [RowData()];
                              _clearAll();
                            });
                          }))
                ],
              ),
            ],
          ),
        ));
  }

  void _clearAll() {
    for (var row in rowData) {
      row.textBox.text = "";
      row.selectedValue = 1;
    }
    _displayText = "";
  }
}
