import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:silver/table.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List colors = [
    {
      'name': 'red',
      'colors': Colors.red,
    },
    {
      'name': 'blue',
      'colors': Colors.blue,
    },
    {
      'name': 'black',
      'colors': Colors.black,
    },
    {
      'name': 'amber',
      'colors': Colors.amber,
    },
    {
      'name': 'green',
      'colors': Colors.green,
    },
    {
      'name': 'tealAccent',
      'colors': Colors.tealAccent,
    },
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (_) => table()));
            },
            child: Text('Go to table')),
        SliverAppBar(
          expandedHeight: 100,
          floating: true,
          pinned: true,
          title: Text('Learning Approach'),
          elevation: 10,
          bottom: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 5,
            automaticallyImplyLeading: false,
            title: TextField(
              decoration: InputDecoration(
                  hintText: 'Nadim Hasan', prefixIcon: Icon(Icons.search)),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(childCount: colors.length,
                (_, index) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 100,
              child: Center(
                child: Text(
                  colors[index]['name'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: colors[index]['colors'],
                  borderRadius: BorderRadius.circular(20)),
            ),
          );
        })),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: colors.length,
              (_, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        colors[index]['name'],
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: colors[index]['colors'],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                );
              },
            ),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.amber,
            height: 100,
            child: Center(
              child: Text('Nadim Hasan'),
            ),
          ),
        )
      ]),
    );
  }
}
