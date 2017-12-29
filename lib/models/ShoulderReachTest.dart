import 'ClinicalTest.dart';
import 'Patient.dart';

class ShoulderReachTest extends ClinicalTest {
  bool resultCalculated = false;
  double shoulderHeight;
  Patient patient;

  double _resultingMinAngle;
  double _resultingMaxReach;

  ShoulderReachTest(
      String title,
      String shortDescription,
      String fullDescription,
      String imageUrl,
      this.shoulderHeight,
      this.patient)
      : super(title, shortDescription, fullDescription, imageUrl);

  @override
  void processTest() {}

  double getMinAngle() {
    return _resultingMinAngle;
  }

  double getMaxReach() {
    return _resultingMaxReach;
  }
}
