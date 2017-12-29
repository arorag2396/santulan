import 'package:flutter/material.dart';
import 'package:santulan/models/ClinicalTest.dart';
import 'package:santulan/view/PaddedCard.dart';

class ClinicalTestListCard extends StatelessWidget {
  final ClinicalTest clinicalTest;

  ClinicalTestListCard(this.clinicalTest);

  @override
  Widget build(BuildContext context) {
    return new PaddedCard(
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getPaddedImageWidget(),
          new Flexible(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _title(context),
                _description(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPaddedImageWidget() {
    return new Padding(
      child: new Image.network(clinicalTest.imageUrl),
      padding: const EdgeInsets.all(8.0),
    );
  }

  Widget _title(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        clinicalTest.title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _description(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: new Text(
        clinicalTest.shortDescription,
        style: Theme.of(context).textTheme.body1,
        softWrap: true,
      ),
    );
  }
}
