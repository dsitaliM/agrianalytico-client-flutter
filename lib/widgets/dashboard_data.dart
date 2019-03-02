import 'package:flutter/material.dart';

class DashboardData extends StatelessWidget {
  const DashboardData();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: DataTable(
      columns: <DataColumn>[
        DataColumn(label: Text('Parameter')),
        DataColumn(label: Text('Value'))
      ],
      rows: dataValues
          .map((value) => DataRow(cells: [
                DataCell(Text(value.parameter)),
                DataCell(Text(value.value))
              ]))
          .toList(),
    ));
  }
}

class DataValue {
  String parameter;
  String value;

  DataValue({this.parameter, this.value});
}

var dataValues = <DataValue>[
  DataValue(parameter: 'Moisture', value: '12 - 13'),
  DataValue(parameter: 'pH', value: '5 - 9')
];
