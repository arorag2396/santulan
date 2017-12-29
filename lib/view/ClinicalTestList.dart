import 'package:flutter/material.dart';
import 'package:santulan/view/ClinicalTestListCard.dart';

class ClinicalTestList extends StatelessWidget {
  final List<ClinicalTestListCard> clinicalTestCards;

  ClinicalTestList(this.clinicalTestCards);

  @override
  Widget build(BuildContext context) {
    return new ListView(children: clinicalTestCards);
  }
}
