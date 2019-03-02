import 'package:agri_analytico_flutter/tabs/home.dart';
import 'package:agri_analytico_flutter/tabs/simple_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(App()));
  //MqttConnect.getData();
}

class App extends StatelessWidget {
  // final routes = <String, WidgetBuilder>{
  //   LoginPage.tag: (context) => LoginPage(),
  //   Home.tag: (context) => Home(),
  // };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agri-Analytico',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: LoginPage(),
      //routes: routes,
    );
  }
}
