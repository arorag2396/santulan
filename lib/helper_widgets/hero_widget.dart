import 'package:flutter/material.dart';
import 'package:sway_test/themes/styling_constants.dart';

class HeroWidget extends StatelessWidget {
  final String mainLogoImageSrc;
  final String heroImageSrc;
  final Widget initialActionWidget;
  static const HERO_IMAGE_BORDER_RADIUS = 20.0;
  static const HERO_IMAGE_TOP_PADDING = 50.0;

  HeroWidget(
    this.mainLogoImageSrc,
    this.heroImageSrc,
    this.initialActionWidget,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: HERO_IMAGE_TOP_PADDING),
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
        initialActionWidget,
      ],
    );
  }
}
