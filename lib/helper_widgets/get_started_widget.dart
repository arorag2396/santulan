import 'package:flutter/material.dart';
import 'package:sway_test/themes/styling_constants.dart';

class GetStartedWidget extends StatelessWidget {
  static const GETTING_STARTED_FONT_SIZE = 30.0;
  static const GETTING_STARTED_BUTTON_RADIUS = 30.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Getting Started",
            style: TextStyle(
              fontSize: GETTING_STARTED_FONT_SIZE,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(PADDING_BETWEEN_WIDGET),
            child: gettingStartedButtonWidget(context),
          ),
        ],
      ),
    );
  }

  Widget gettingStartedButtonWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius:
                  BorderRadius.circular(GETTING_STARTED_BUTTON_RADIUS),
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
