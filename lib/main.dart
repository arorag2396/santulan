import 'package:flutter/material.dart';
import 'package:sway_test/UserInfo.dart';
import 'package:sway_test/helper_widgets/choose_timer_widget.dart';
import 'package:sway_test/helper_widgets/hero_widget.dart';
import 'package:sway_test/helper_widgets/terms_conditions_widget.dart';

import 'helper_widgets/get_started_widget.dart';
import 'helper_widgets/logo_with_widget.dart';

UserInfo userInfo = UserInfo();

final routes = <String, WidgetBuilder>{
  '/terms': (BuildContext context) => LogoWithWidget(
        "assets/images/logo.png",
        HeroWidget(
          '',
          '',
          TermsConditionsWidget('https://www.google.com/'),
        ),
      ),
  '/start': (BuildContext context) => LogoWithWidget(
        "assets/images/logo.png",
        HeroWidget(
          '',
          '',
          GetStartedWidget(),
        ),
      ),
  '/timer': (BuildContext context) => Scaffold(
    body: LogoWithWidget(
          "assets/images/logo.png",
          ChooseTimerWidget(),
        ),
  ),
};

void main() => runApp(
      MyApp(),
    );

Stopwatch stopwatch = new Stopwatch();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: LogoWithWidget(
          "assets/images/logo.png",
          HeroWidget(
            '',
            '',
            GetStartedWidget(),
          ),
        ),
//        body: LogoWithWidget("assets/images/logo.png",HeroWidget('','', GetStartedWidget())),
//        body: LogoWithWidget("assets/images/logo.png",ChooseTimerWidget()),
      ),
    );
  }
}
