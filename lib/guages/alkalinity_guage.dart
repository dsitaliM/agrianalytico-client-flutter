import 'package:agri_analytico_flutter/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AlkalinityGuage extends StatefulWidget {
  final double ph;
  AlkalinityGuage(this.ph);
  @override
  AlkalinityGuageState createState() => AlkalinityGuageState();
}

class AlkalinityGuageState extends State<AlkalinityGuage> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Expanded(
          child: LinearPercentIndicator(
            percent: Helpers.convertValue(widget.ph),
            center: Text('${widget.ph}'),
            width: 320,
            progressColor: Colors.red,
            lineHeight: 20,
            backgroundColor: Colors.black12,
          ),
          flex: 1,
        ),
        Expanded(
          child: Text('Alkalinity (pH)'),
          flex: 1,
        )
      ],
    );
  }
}
