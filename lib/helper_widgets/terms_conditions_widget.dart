import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sway_test/themes/styling_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsConditionsWidget extends StatefulWidget {
  final String termsConditionsURL;

  TermsConditionsWidget(
    this.termsConditionsURL,
  );

  _TermsConditionsWidget createState() =>
      _TermsConditionsWidget(termsConditionsURL);
}

class _TermsConditionsWidget extends State<TermsConditionsWidget> {
  final String termsConditionsURL;
  static const AGREED_BUTTON_SIDES_PADDING = 20.0;
  static const AGREED_BUTTON_TOP_BOTTOM_PADDING = 8.0;
  static const AGREED_BUTTON_FONT_SIZE = 30.0;

  _TermsConditionsWidget(this.termsConditionsURL);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: PADDING_BETWEEN_WIDGET,
              right: PADDING_BETWEEN_WIDGET,
              top: PADDING_BETWEEN_WIDGET,
              bottom: PADDING_BETWEEN_WIDGET),
          child: termsConditionTextWidget(context),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: PADDING_BETWEEN_WIDGET,
              right: PADDING_BETWEEN_WIDGET,
              bottom: PADDING_BETWEEN_WIDGET),
          child: termsConditionAgreeWidget(context),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: PADDING_BETWEEN_WIDGET,
              right: PADDING_BETWEEN_WIDGET,
              bottom: PADDING_BETWEEN_WIDGET),
          child: termsConditionAgreeButtonWidget(context),
        ),
      ],
    );
  }

  Widget termsConditionTextWidget(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'In order to start using Santulan, please first agree to our ',
        style: DefaultTextStyle.of(context)
            .style
            .copyWith(fontSize: PARAGRAPH_FONT_SIZE),
        children: <TextSpan>[
          TextSpan(
            text: 'Terms & Conditions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
//              fontSize: PARAGRAPH_FONT_SIZE,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                if (await canLaunch(termsConditionsURL)) {
                  launch(termsConditionsURL);
                }
              },
          ),
        ],
      ),
    );
  }

  Widget termsConditionAgreeWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: CheckboxListTile(
        title: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: Colors.black)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: PADDING_BETWEEN_WIDGET),
            child: Text(
              "I agree to Santulan's Terms & Conditions",
            ),
          ),
        ),
        value: timeDilation != 1.0,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool value) {
          setState(() {
            timeDilation = value ? 5.0 : 1.0;
          });
        },
      ),
    );
  }

  Widget termsConditionAgreeButtonWidget(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          new RaisedButton(
              color: Colors.white,
              onPressed: () => new Text(
                    "Next Page",
                  ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: AGREED_BUTTON_SIDES_PADDING,
                    right: AGREED_BUTTON_SIDES_PADDING,
                    top: AGREED_BUTTON_TOP_BOTTOM_PADDING,
                    bottom: AGREED_BUTTON_TOP_BOTTOM_PADDING),
                child: new Text(
                  "Agreed",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: AGREED_BUTTON_FONT_SIZE,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.black),
              )),
        ],
      ),
    );
  }
}
