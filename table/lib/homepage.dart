import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Table(
              textDirection: TextDirection.ltr,
              border: TableBorder.all(width: 1, color: Colors.black),
              children: [
                TableRow(children: [
                  Heading('Name'),
                  Heading('Age'),
                  Heading('ID'),
                ]),
                TableRow(children: [
                  Data('Nadim'),
                  Data('20'),
                  Data('48'),
                ]),
                TableRow(children: [
                  Data('Nadim'),
                  Data('20'),
                  Data('48'),
                ]),
                TableRow(children: [
                  Data('Nadim'),
                  Data('20'),
                  Data('48'),
                ]),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            DataTable(border: TableBorder.all(), columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Id')),
              DataColumn(label: Text('Age')),
            ], rows: [
              DataRow(cells: [
                DataCell(Text('Nadim')),
                DataCell(Text('25')),
                DataCell(Text('48')),
              ]),
              DataRow(selected: true, cells: [
                DataCell(Text('Nadim')),
                DataCell(Text('25')),
                DataCell(Text('48')),
              ]),
              DataRow(cells: [
                DataCell(Text('Nadim')),
                DataCell(Text('25')),
                DataCell(Text('48')),
              ]),
            ])
          ],
        ),
      ),
    );
  }
}

Widget Heading(name) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );
}

Widget Data(name) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
    ),
  );
}
