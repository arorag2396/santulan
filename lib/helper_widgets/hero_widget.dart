import 'package:flutter/material.dart';
import 'package:sway_test/themes/styling_constants.dart';

class HeroWidget extends StatelessWidget {
  final String mainLogoImageSrc;
  final String heroImageSrc;
  final Widget initialActionWidget;
  static const HERO_IMAGE_BORDER_RADIUS = 20.0;

  HeroWidget(
    this.mainLogoImageSrc,
    this.heroImageSrc,
    this.initialActionWidget,
  );

  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.only(
              top: (availableHeight *
                  getDesiredScreenValue(availableHeight, 0.04, 0.10, .12)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(HERO_IMAGE_BORDER_RADIUS),
                  bottomRight: Radius.circular(HERO_IMAGE_BORDER_RADIUS)),
              child: Image.asset(
                'assets/images/balanced_bg.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Expanded(child: initialActionWidget),
      ],
    );
  }
}
