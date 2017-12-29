import 'package:flutter/material.dart';
import 'package:santulan/models/Patient.dart';
import 'package:santulan/models/Sex.dart';
import 'package:santulan/models/ShoulderReachTest.dart';
import 'package:santulan/view/ClinicalTestList.dart';
import 'package:santulan/view/ClinicalTestListCard.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
            // counter didn't reset back to zero; the application is not restarted.
            primarySwatch: Colors.blue),
        home: new Scaffold(
          appBar: new AppBar(
            title: const Text('Clinical Tests'),
          ),
          body: new ClinicalTestList(clinicalTestCards),
        ));
  }
}

var clinicalTestCards = [
  new ClinicalTestListCard(new ShoulderReachTest(
      "ShoulderReachTest1",
      "Something that explains this test",
      "Something that explains this test",
      "http://via.placeholder.com/100X100",
      1.5,
      new Patient(1, "Gaurav", Sex.MALE, 1.2, 1.4, new DateTime(1996)))),
  new ClinicalTestListCard(new ShoulderReachTest(
      "ShoulderReachTest2",
      "Something that explains this Hello world hwo",
      "Something thatsklfdjaskldjfn;alskdfjb;",
      "http://via.placeholder.com/100X100",
      1.5,
      new Patient(1, "Gaurav", Sex.MALE, 1.2, 1.4, new DateTime(1996)))),
  new ClinicalTestListCard(new ShoulderReachTest(
      "ShoulderReachTest3",
      "Something that explains this test",
      "Something that explains this test",
      "http://via.placeholder.com/100X100",
      1.5,
      new Patient(1, "Gaurav", Sex.MALE, 1.2, 1.4, new DateTime(1996))))
];
