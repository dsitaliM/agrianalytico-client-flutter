import 'dart:convert';
import 'dart:ui';

import 'package:agri_analytico_flutter/guages/alkalinity_guage.dart';
import 'package:agri_analytico_flutter/guages/humidity_guage.dart';
import 'package:agri_analytico_flutter/guages/luminosity_guage.dart';
import 'package:agri_analytico_flutter/guages/temperature_guage.dart';
import 'package:agri_analytico_flutter/models/crop.dart';
import 'package:agri_analytico_flutter/widgets/dashboard_logo.dart';
import 'package:agri_analytico_flutter/widgets/plant_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:agri_analytico_flutter/guages/moisture_guage.dart';
import 'package:mqtt_client/mqtt_client.dart';

class Dashboard extends StatefulWidget {
  final Crop crop;
  Dashboard(this.crop);
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  double humidity;
  double temperature;
  double moisture;
  double luminosity;
  double ph;

  Color colorStatus;
  String status;
  IconData icon;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.initState();

    humidity = 0.0;
    temperature = 0.0;
    moisture = 0.0;
    luminosity = 0.0;
    ph = 0.0;
    colorStatus = Colors.green;
    status = "Loading...";
    icon = Icons.check_circle_outline;
  }

  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(6, 4),
    //const StaggeredTile.count(6, 1),
    const StaggeredTile.count(3, 3),
    const StaggeredTile.count(3, 3),
    //const StaggeredTile.count(2, 6),
    const StaggeredTile.count(3, 3),
    const StaggeredTile.count(3, 3),
    const StaggeredTile.count(6, 2),
  ];

  DashboardState() {
    getData();
  }

  Future<String> getData() async {
    String messagePayload = "";
    String messagePayload2 = "";
    final MqttClient client =
        MqttClient.withPort('test.mosquitto.org', 'raspberry01', 1883);

    try {
      await client.connect();
    } on Exception catch (e) {
      debugPrint('Failed with Execption: $e');
      client.disconnect();
    }

    client.subscribe('dht11xq', MqttQos.atLeastOnce);
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload;
      messagePayload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);

      Map values = json.decode(messagePayload);

      if (this.mounted) {
        this.setState(() {
          if (values['temperature'] != null) {
            this.temperature = double.parse(values['temperature']);
          }
          if (values['humidity'] != null) {
            this.humidity = double.parse(values['humidity']);
          }
        });
      }
    });

    client.subscribe('arduinoxq', MqttQos.atLeastOnce);
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message2 = c[0].payload;
      messagePayload2 =
          MqttPublishPayload.bytesToStringAsString(message2.payload.message);

      Map values = json.decode(messagePayload2);

      if (this.mounted) {
        this.setState(() {
          if (values['light'] != null) {
            this.luminosity = values['light'].toDouble();
          }
          if (values['moisture'] != null) {
            this.moisture = values['moisture'].toDouble();
            this.ph = 6.3;
            this.status = "Okay";
            if (values['moisture'] >= 0 && values['moisture'] <= 10) {
              this.status = "Moisture levels too low.";
              this.colorStatus = Colors.yellow;
              this.icon = Icons.warning;
            } else if (values['moisture'] >= 71 && values['moisture'] <= 100) {
              this.status = "Moisture levels too high.";
              this.colorStatus = Colors.red;
              this.icon = Icons.warning;
            }
          }
        });
      }
    });

    return messagePayload2;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/corn.jpeg'), fit: BoxFit.cover)),
      child: new Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: new StaggeredGridView.count(
            crossAxisCount: 6,
            staggeredTiles: _staggeredTiles,
            children: [
              ClipRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Card(
                      child: LogoText(widget.crop, this.status),
                      color: Colors.grey.shade200.withOpacity(0.8),
                    )),
              ),
              ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Card(
                        child: TemperatureGuage(this.temperature),
                        color: Colors.grey.shade200.withOpacity(0.5),
                      ))),
              ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Card(
                        child: MoistureGuage(this.moisture),
                        color: Colors.grey.shade200.withOpacity(0.5),
                      ))),
              ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Card(
                        child: HumidityGuage(this.humidity),
                        color: Colors.grey.shade200.withOpacity(0.5),
                      ))),
              ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Card(
                        child: LuminosityGuage(this.luminosity),
                        color: Colors.grey.shade200.withOpacity(0.5),
                      ))),
              ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Card(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                child: AlkalinityGuage(this.ph),
                                padding: EdgeInsets.only(top: 12.0),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          color: Colors.grey.shade200.withOpacity(0.5))))
            ],
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            padding: const EdgeInsets.all(5.0),
          )),
    ));
  }
}
