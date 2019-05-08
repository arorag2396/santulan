import 'package:flutter/material.dart';
import 'package:sway_test/main.dart';
import 'package:sway_test/sensor_collector.dart';

// Create a Form Widget
class UserForm extends StatefulWidget {
  @override
  UserFormState createState() {
    return UserFormState();
  }
}

String dropdownValue = '90';

// Create a corresponding State class. This class will hold the data related to
// the form.
class UserFormState extends State<UserForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<UserFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DropdownButton<String>(
            value: dropdownValue,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
                userInfo.setTimer(newValue);
              });
            },
            items: <String>['15', '30', '45', '60', '90']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SensorCollectorMaterialApp(userInfo, Stopwatch())),
                );
              },
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
