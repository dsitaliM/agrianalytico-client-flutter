import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart';
import 'package:material_switch/material_switch.dart';

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/corn.jpeg'),
                fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            Card(
              child: Padding(
                child: ThresholdControl(),
                padding: EdgeInsets.all(30.0),
              ),
              margin: EdgeInsets.all(10.0),
              color: Colors.grey.shade200.withOpacity(0.5),
            ),
            Card(
              child: Padding(
                child: WaterControl(),
                padding: EdgeInsets.all(30.0),
              ),
              margin: EdgeInsets.all(10.0),
              color: Colors.grey.shade200.withOpacity(0.5),
            ),
            Card(
                child: Padding(
                  child: NotificationControl(),
                  padding: EdgeInsets.all(30.0),
                ),
                margin: EdgeInsets.all(10.0),
                color: Colors.grey.shade200.withOpacity(0.5))
          ],
        ));
  }
}

class ThresholdControl extends StatefulWidget {
  _ThresholdControlState createState() => _ThresholdControlState();
}

class _ThresholdControlState extends State<ThresholdControl> {
  double _lowerValue = 20.0;
  double _upperValue = 80.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Set Custom Water Threshold', style: TextStyle(fontSize: 18)),
          SizedBox(height: 55.0),
          RangeSlider(
            min: 0.0,
            max: 100.0,
            lowerValue: _lowerValue,
            upperValue: _upperValue,
            divisions: 50,
            showValueIndicator: true,
            valueIndicatorMaxDecimals: 1,
            onChanged: (double newLowerValue, double newUpperValue) {
              setState(() {
                _lowerValue = newLowerValue;
                _upperValue = newUpperValue;
              });
            },
          )
        ],
      ),
    );
  }
}

class NotificationControl extends StatefulWidget {
  _NotificationControlState createState() => _NotificationControlState();
}

class _NotificationControlState extends State<NotificationControl> {
  List<String> switchOptions = ["On", "Off"];
  String selectedSwitchOption = "On";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Notifications', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          MaterialSwitch(
            options: switchOptions,
            selectedBackgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

class WaterControl extends StatefulWidget {
  _WaterControlState createState() => _WaterControlState();
}

class _WaterControlState extends State<WaterControl> {
  List<String> switchOptions = ["Auto", "Manual"];
  String selectedSwitchOption = "Auto";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Set Water Control', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          MaterialSwitch(
            options: switchOptions,
            selectedBackgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
