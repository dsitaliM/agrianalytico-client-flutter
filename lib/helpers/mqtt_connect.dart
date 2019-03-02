import 'dart:convert';
import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:flutter/material.dart';

class MqttConnect {
  static double temp = 0.0;
  static double humidity = 0;
  static double moisture = 0;
  static double pH = 0;

  static Future<String> getData() async {
    String messagePayload;
    final MqttClient client =
        MqttClient.withPort('test.mosquitto.org', '', 1883);

    try {
      await client.connect();
    } on Exception catch (ex) {
      debugPrint('Failed with Exception: $ex');
    }

    void onDisconnected() => exit(-1);
    client.onDisconnected = onDisconnected;

    client.subscribe('dht11xq', MqttQos.atLeastOnce);

    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload;
      messagePayload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);

      Map values = json.decode(messagePayload);

      temp = double.parse(values['temperature']);
      humidity = double.parse(values['humidity']);
    });

    return messagePayload;
  }
}
