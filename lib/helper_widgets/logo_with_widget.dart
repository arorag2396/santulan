import 'package:flutter/material.dart';
import 'package:sway_test/themes/styling_constants.dart';

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
    final availableHeight = MediaQuery.of(context).size.height;
    print(availableHeight);
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(
            image: AssetImage(mainLogoImageSrc),
            width: getDesiredScreenValue(availableHeight, 150, 200, 250),
          ),
          Expanded(
            child: child,
          )
        ],
      ),
    );
  }
}
