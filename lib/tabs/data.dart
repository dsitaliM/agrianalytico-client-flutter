import 'dart:ui';

import 'package:agri_analytico_flutter/models/crop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CropDataTable extends StatelessWidget {
  final Crop crop;
  CropDataTable(this.crop);
  @override
  Widget build(BuildContext context) {
    List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
      const StaggeredTile.count(6, 1),
      const StaggeredTile.count(6, 4),
      const StaggeredTile.count(6, 4),
      // const StaggeredTile.count(2, 4),
      // const StaggeredTile.count(2, 3),
      // const StaggeredTile.count(6, 3),
    ];

    String cropData =
        """## pH Range: \n${crop.phRange} \n## Root Depth: \n${crop.rootDepth} \n## MAD Value: \n${crop.madValue}""";
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Color.fromRGBO(251, 176, 58, 1)),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: StaggeredGridView.count(
          crossAxisCount: 6,
          staggeredTiles: _staggeredTiles,
          children: <Widget>[
            ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Card(
                    child: Text('${crop.name}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 35.0)),
                    color: Colors.grey.shade200.withOpacity(0.8),
                  )),
            ),
            Card(
              //child: LogoText(widget.crop, this.status),
              child: Image(
                  image: AssetImage('assets/images/${crop.image}'),
                  fit: BoxFit.fill),
              color: Colors.grey.shade200.withOpacity(0.8),
            ),
            ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Card(
                    child: Markdown(data: cropData),
                    color: Colors.grey.shade200.withOpacity(0.8),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
