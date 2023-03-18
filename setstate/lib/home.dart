import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setstate/another.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int data = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nadim Hasan',
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, CupertinoPageRoute(builder: (_) => Another(data)));
              },
              icon: Icon(Icons.account_balance_wallet_outlined)),
          Icon(Icons.anchor),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          data += 5;
        });
      }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              data.toString(),
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
