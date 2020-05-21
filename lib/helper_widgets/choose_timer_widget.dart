import 'package:flutter/material.dart';
import 'package:sway_test/themes/styling_constants.dart';

class ChooseTimerWidget extends StatelessWidget {
  static const GETTING_STARTED_FONT_SIZE = 30.0;
  static const GETTING_STARTED_BUTTON_RADIUS = 30.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Getting Started",
            style: TextStyle(
              fontSize: GETTING_STARTED_FONT_SIZE,
            ),
          ),
        ],
      ),
    );
  }
}
