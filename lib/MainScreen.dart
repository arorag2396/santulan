import 'package:flutter/material.dart';
import 'package:sway_test/main.dart';
import 'package:sway_test/SensorCollector.dart';

// Create a Form Widget
class UserForm extends StatefulWidget {
  @override
  UserFormState createState() {
    return UserFormState();
  }
}

String dropdownValue = '90';

class UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              )
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: MaterialButton(
                minWidth: 100.0,
                height: 75.0,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SensorCollectorMaterialApp(userInfo, Stopwatch())),
                  );
                },
                child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0, bottom:20.0),
                    child: Text('Next',
                      style: TextStyle(fontSize: 32),
                      textAlign: TextAlign.center,
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
