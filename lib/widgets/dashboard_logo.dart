import 'package:agri_analytico_flutter/models/crop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class LogoText extends StatefulWidget {
  final Crop crop;
  final String status;
  const LogoText(this.crop, this.status);
  @override
  LogoTextState createState() => LogoTextState();
}

class LogoTextState extends State<LogoText> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/${widget.crop.image}'),
                      fit: BoxFit.cover)),
            ),
            flex: 4,
          ),
          Expanded(
            child: Container(
              child: Markdown(
                  data:
                      """## Field Name: \n${widget.crop.name} Field \n## Crop: \n${widget.crop.name}\n ## Status:\n${widget.status}"""),
              //padding: EdgeInsets.all(4.0),
            ),
            flex: 4,
          )
        ],
      ),
    );
  }
}
