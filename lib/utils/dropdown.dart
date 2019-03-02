import 'package:flutter/material.dart';

class SelectionWidget extends StatefulWidget {
  SelectionWidget({Key key}) : super(key: key);
  @override
  _SelectionWidgetState createState() => _SelectionWidgetState();
}

class _SelectionWidgetState extends State<SelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Tomato'),
    );
  }
}
