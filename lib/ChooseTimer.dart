import 'package:flutter/material.dart';
import 'package:sway_test/UserInfo.dart';
import 'package:sway_test/helper_widgets/choose_timer_widget.dart';
import 'package:sway_test/helper_widgets/hero_widget.dart';
import 'package:sway_test/helper_widgets/terms_conditions_widget.dart';

import 'helper_widgets/get_started_widget.dart';
import 'helper_widgets/logo_with_widget.dart';

UserInfo userInfo = UserInfo();

void main() => runApp(MyApp());

Stopwatch stopwatch = new Stopwatch();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LogoWithWidget("assets/images/logo.png",ChooseTimerWidget()),
      ),
    );
  }
}
