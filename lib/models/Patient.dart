import 'Sex.dart';

class Patient {
  final int patientId;
  final String name;
  final Sex sex;
  double height;
  double weight;
  final DateTime dob;

  Patient(
      this.patientId, this.name, this.sex, this.height, this.weight, this.dob);
}
