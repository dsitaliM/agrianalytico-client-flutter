import 'package:agri_analytico_flutter/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MoistureGuage extends StatefulWidget {
  final double moisture;
  MoistureGuage(this.moisture);
  @override
  MoistureGuageState createState() => MoistureGuageState();
}

class MoistureGuageState extends State<MoistureGuage> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Expanded(
          child: CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 10.0,
            percent: Helpers.convertValue(widget.moisture),
            center: Text('${widget.moisture}%'),
            progressColor: Colors.blue,
            backgroundColor: Colors.black12,
          ),
          flex: 4,
        ),
        Expanded(
          child: Text('Water Level'),
          flex: 1,
        )
      ],
    );
  }
}
