import 'package:flutter/material.dart';

class PlantPicture extends StatefulWidget {
  final Color iconColor;
  final String statusString;
  final IconData icon;
  PlantPicture(this.iconColor, this.statusString, this.icon);

  @override
  PlantPictureState createState() => PlantPictureState();
}

class PlantPictureState extends State<PlantPicture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Center(child: Text('Crop:\nBroadleaf')),
            ),
            flex: 1,
          ),
          Expanded(
            child: Center(
                child: Icon(
              widget.icon,
              size: 72.0,
              color: widget.iconColor,
            )),
            flex: 1,
          ),
          Expanded(
            child: Center(
              child: Text('Status: ${widget.statusString}'),
            ),
            flex: 1,
          ),
          Expanded(
            child: new OverflowBox(
                child: Image(
              image: AssetImage('assets/images/tomato.png'),
              fit: BoxFit.fitHeight,
            )),
            flex: 3,
          ),
        ],
      ),
    );
  }
}
