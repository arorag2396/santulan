import 'package:flutter/material.dart';
import 'package:santulan/helper_widgets/get_started_widget.dart';
import 'package:santulan/helper_widgets/hero_widget.dart';
import 'package:santulan/themes/styling_constants.dart';
import '../../helper_widgets/logo_with_widget.dart';


class GettingStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogoWithWidget(
        HERO_LOGO_ADDRESS,
        HeroWidget(
          '',
          '',
          GetStartedWidget(),
        ),
      ),
    );
  }
}
