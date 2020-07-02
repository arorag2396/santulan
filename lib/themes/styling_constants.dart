const PADDING_BETWEEN_WIDGET = 20.0;
const PARAGRAPH_FONT_SIZE = 16.0;
const CIRCULAR_BUTTON_RADIUS = 30.0;
const HERO_LOGO_ADDRESS = 'assets/images/logo.png';

const double MIN_SCREEN_RATIO = 150;
const double MID_SCREEN_RATIO = 200;
const double MAX_SCREEN_RATIO = 250;

double getDesiredScreenValue(
    double screenSize, double min, double mid, double max) {
  double desiredValue;
  if (screenSize < 700) {
    desiredValue = min;
  } else if (screenSize < 850) {
    desiredValue = mid;
  } else {
    desiredValue = max;
  }
  return desiredValue;
}
