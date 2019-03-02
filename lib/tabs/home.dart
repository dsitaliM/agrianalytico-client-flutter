import 'package:agri_analytico_flutter/models/crop.dart';
import 'package:agri_analytico_flutter/tabs/actions.dart';
import 'package:agri_analytico_flutter/tabs/dashboard.dart';
import 'package:agri_analytico_flutter/tabs/data.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static String tag = 'home-page';
  final Crop crop;
  Home(this.crop);
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [
      Dashboard(widget.crop),
      Actions(),
      CropDataTable(widget.crop),
    ];
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            title: Row(
              children: <Widget>[
                //Image.asset('assets/images/agri.png'),
                Text('Agri-Analytico'),
              ],
            ),
            backgroundColor: Color.fromRGBO(56, 181, 74, 1)),
        body: _children[_currentIndex],
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Color.fromRGBO(56, 181, 74, 1),
                primaryColor: Color.fromRGBO(251, 176, 58, 1)),
            child: BottomNavigationBar(
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard), title: Text('Dashboard')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), title: Text('Actions')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.library_books), title: Text('Data')),
              ],
            )));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
