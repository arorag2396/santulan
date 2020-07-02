import 'package:flutter/material.dart';
import 'package:santulan/themes/styling_constants.dart';

class GetStartedWidget extends StatelessWidget {
  static const GETTING_STARTED_FONT_SIZE = 30.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Getting Started",
              style: TextStyle(
                fontSize: GETTING_STARTED_FONT_SIZE,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: PADDING_BETWEEN_WIDGET),
              child: gettingStartedButtonWidget(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget gettingStartedButtonWidget(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius:
          BorderRadius.circular(CIRCULAR_BUTTON_RADIUS),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/choose_timer");
          },
        ),
      ),
    );
  }
}

