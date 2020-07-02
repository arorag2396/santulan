import 'package:flutter/material.dart';
import 'package:santulan/helper_widgets/choose_timer_widget.dart';
import 'package:santulan/themes/styling_constants.dart';
import '../../helper_widgets/logo_with_widget.dart';


class ChooseTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LogoWithWidget(
        HERO_LOGO_ADDRESS,
        ChooseTimerWidget(),
      ),
    );
  }
}
