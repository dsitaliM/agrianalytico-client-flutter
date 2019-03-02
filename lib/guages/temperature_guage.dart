import 'package:agri_analytico_flutter/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TemperatureGuage extends StatefulWidget {
  final double temperature;
  TemperatureGuage(this.temperature);
  @override
  TemperatureGuageState createState() => TemperatureGuageState();
}

class TemperatureGuageState extends State<TemperatureGuage> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Expanded(
          child: CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 10.0,
            percent: Helpers.convertValue(widget.temperature),
            center: Text('${widget.temperature}°C'),
            progressColor: Colors.orange,
            backgroundColor: Colors.black12,
          ),
          flex: 4,
        ),
        Expanded(
          child: Text('Temperature'),
          flex: 1,
        )
      ],
    );
  }
}
