import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:santulan/UserInfo.dart';
import 'package:santulan/complete_pages/other_pages/getting_started.dart';
import 'package:santulan/helper_widgets/hero_widget.dart';
import 'package:santulan/themes/styling_constants.dart';
import 'complete_pages/other_pages/choose_timer.dart';
import 'complete_pages/other_pages/terms_and_conditions.dart';
import 'complete_pages/sway_test/sway_results.dart';
import 'complete_pages/sway_test/sway_test_settings.dart';
import 'helper_widgets/get_started_widget.dart';
import 'helper_widgets/logo_with_widget.dart';
import 'helper_widgets/terms_conditions_widget.dart';

UserInfo userInfo = UserInfo();

final routes = <String, WidgetBuilder>{
  '/terms': (BuildContext context) => TermsAndConditions(),
  '/start': (BuildContext context) => GettingStarted(),
  '/choose_timer': (BuildContext context) => ChooseTimer(),
  '/settings': (BuildContext context) => SwayTestSettings(),
  '/result': (BuildContext context) => SwayResults(),
};

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

Stopwatch stopwatch = new Stopwatch();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: LogoWithWidget(
          HERO_LOGO_ADDRESS,
          HeroWidget(
            '',
            '',
            TermsConditionsWidget('https://www.google.com/'),
          ),
        ),
//        body: LogoWithWidget("assets/images/logo.png",HeroWidget('','', GetStartedWidget())),
//        body: LogoWithWidget("assets/images/logo.png",ChooseTimerWidget()),
      ),
    );
  }
}