import 'package:agri_analytico_flutter/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HumidityGuage extends StatefulWidget {
  final double humidity;
  HumidityGuage(this.humidity);
  @override
  HumidityGuageState createState() => HumidityGuageState();
}

class HumidityGuageState extends State<HumidityGuage> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Expanded(
          child: CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 10.0,
            percent: Helpers.convertValue(widget.humidity),
            center: Text('${widget.humidity}%'),
            progressColor: Colors.lime,
            backgroundColor: Colors.black12,
          ),
          flex: 4,
        ),
        Expanded(
          child: Text('Humidty'),
          flex: 1,
        )
      ],
    );
  }
}

class CropMonitor extends StatefulWidget {
  _CropMonitorState createState() => _CropMonitorState();
}

class _CropMonitorState extends State<CropMonitor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
