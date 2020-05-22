const PADDING_BETWEEN_WIDGET = 20.0;
const PARAGRAPH_FONT_SIZE = 16.0;

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
