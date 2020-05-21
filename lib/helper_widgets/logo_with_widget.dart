import 'package:flutter/material.dart';

class LogoWithWidget extends StatelessWidget {
  final String mainLogoImageSrc;
  final Widget child;
  static const SIDES_PADDING_MAIN_LOGO = 50.0;
  static const TOP_BOTTOM_PADDING_MAIN_LOGO = 20.0;

  LogoWithWidget(
    this.mainLogoImageSrc,
    this.child,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: SIDES_PADDING_MAIN_LOGO, right: SIDES_PADDING_MAIN_LOGO, top: TOP_BOTTOM_PADDING_MAIN_LOGO, bottom: TOP_BOTTOM_PADDING_MAIN_LOGO),
            child: Image(
              image: AssetImage(mainLogoImageSrc),
            ),
          ),
          child
        ],
      ),
    );
  }
}
