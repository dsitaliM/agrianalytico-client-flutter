import 'package:agri_analytico_flutter/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LuminosityGuage extends StatefulWidget {
  final double luminosity;
  LuminosityGuage(this.luminosity);
  @override
  LuminosityGuageState createState() => LuminosityGuageState();
}

class LuminosityGuageState extends State<LuminosityGuage> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Expanded(
          child: CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 10.0,
            percent: Helpers.convertValue(widget.luminosity),
            center: Text('${widget.luminosity}%'),
            progressColor: Colors.yellow,
            backgroundColor: Colors.black12,
          ),
          flex: 4,
        ),
        Expanded(
          child: Text('Lighting'),
          flex: 1,
        )
      ],
    );
  }
}
