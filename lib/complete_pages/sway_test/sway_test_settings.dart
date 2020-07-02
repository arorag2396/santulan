import 'package:flutter/material.dart';
import 'package:santulan/helper_widgets/circular_timer_widget.dart';
import 'package:santulan/helper_widgets/hero_widget.dart';
import 'package:santulan/model/choose_time_arguments.dart';
import 'package:santulan/themes/styling_constants.dart';
import '../../helper_widgets/logo_with_widget.dart';
import 'dart:developer' as developer;

class SwayTestSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChooseTimeArguments selectedTimeArg =
        ModalRoute.of(context).settings.arguments;

    if (selectedTimeArg == null) {
      developer.log("Time should always been selected.");
    }

    final selectedTime =
        selectedTimeArg == null ? 45 : selectedTimeArg.selectedTime;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LogoWithWidget(
        HERO_LOGO_ADDRESS,
        CircularTimerWidget(selectedTime),
      ),
    );
  }
}
