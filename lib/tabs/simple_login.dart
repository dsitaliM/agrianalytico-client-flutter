import 'dart:ui';

import 'package:agri_analytico_flutter/models/crop.dart';
import 'package:agri_analytico_flutter/models/crop_repo.dart';
import 'package:agri_analytico_flutter/tabs/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  LoginPage() {
    //SystemChrome.setEnabledSystemUIOverlays([]);
  }
  static String tag = 'login-page';
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List _crops = [
    "Tobacco",
    "Maize",
    "Sugarcane",
    "Cotton",
    "Soybeans",
    "Tomato"
  ];
  List _soils = [
    "Loam",
    "Loamy Sand",
    "Sandy",
    "Sandy Loam",
    "Silt Loam",
    "Silt Clay",
    "Clay"
  ];
  List<DropdownMenuItem<String>> _cropDropDownItems;
  List<DropdownMenuItem<String>> _soilDropDownItems;
  String _currentCrop;
  String _currentSoil;
  //String _cropName;
  Crop _crop;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    _cropDropDownItems = getDropDownMenuItems(_crops);
    _soilDropDownItems = getDropDownMenuItems(_soils);
    _currentCrop = _cropDropDownItems[0].value;
    _currentSoil = _soilDropDownItems[0].value;
    _crop = cropsList[2];
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems(List types) {
    List<DropdownMenuItem<String>> items = new List();
    for (String type in types) {
      items.add(new DropdownMenuItem(
          value: type,
          child: Text(
            type,
            style: TextStyle(color: Colors.white),
          )));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 65,
        child: Image.asset('assets/images/agri.png'),
      ),
    );

    final field = TextFormField(
      keyboardType: TextInputType.text,
      style: TextStyle(
          color: Colors.white, fontFamily: "Montserrat", fontSize: 16),
      autofocus: false,
      initialValue: 'field1',
      decoration: InputDecoration(
          labelText: "Field Name",
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    final deviceId = TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(
            color: Colors.white, fontFamily: "Montserrat", fontSize: 16),
        autofocus: false,
        initialValue: '34-232',
        decoration: InputDecoration(
          labelText: "Device ID",
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ));

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: Color.fromRGBO(56, 181, 74, 1),
        borderRadius: BorderRadius.circular(5.0),
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200,
          height: 42.0,
          onPressed: () {
            //Navigator.of(context).pushNamed(Home.tag);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home(_crop)));
            //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
          },
          child: Text('Login', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final requestNewCrop = FlatButton(
      child: Text('Need help?', style: TextStyle(color: Colors.white)),
      onPressed: () {},
    );

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/corn.jpeg'),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 24.0, right: 24.0),
                    children: <Widget>[
                      logo,
                      SizedBox(height: 6.0),
                      Center(
                        child: Text('Agri-Analytico',
                            style:
                                TextStyle(fontSize: 32, color: Colors.white)),
                      ),
                      SizedBox(height: 18.0),
                      deviceId,
                      SizedBox(height: 8.0),
                      field,
                      SizedBox(height: 8.0),
                      Theme(
                        data: Theme.of(context).copyWith(
                            canvasColor: Theme.of(context).backgroundColor),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(labelText: 'Soil type'),
                          value: _currentSoil,
                          items: _soilDropDownItems,
                          onChanged: changedDropDownItemSoil,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Theme(
                          data: Theme.of(context).copyWith(
                              canvasColor: Theme.of(context).backgroundColor),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(labelText: 'Crop'),
                            value: _currentCrop,
                            items: _cropDropDownItems,
                            onChanged: changedDropDownItemCrop,
                          )),
                      SizedBox(height: 24.0),
                      loginButton,
                      requestNewCrop
                    ],
                  ),
                ),
              ),
            )));
  }

  void changedDropDownItemSoil(String selected) {
    setState(() {
      _currentSoil = selected;
    });
  }

  void changedDropDownItemCrop(String selected) {
    setState(() {
      _currentCrop = selected;
      _crop = cropsList.firstWhere((crop) => crop.name == selected,
          orElse: () => cropsList[2]);
    });
  }
}
