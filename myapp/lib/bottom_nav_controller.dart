import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:myapp/Pages/Provider.dart';
import 'package:myapp/Pages/account.dart';
import 'package:myapp/Pages/add.dart';
import 'package:myapp/Pages/chat.dart';
import 'package:myapp/Pages/home_screen.dart';
import 'package:myapp/Pages/my_add.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({super.key});

  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  final Pages = [HomeScreen(), MyAdd(), Add(), Chat(), Account(), Provider()];
  var _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentindex,
          onTap: (int Index) {
            _currentindex = Index;
            setState(() {});
          },
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(color: Colors.purple),
          unselectedLabelStyle: TextStyle(color: Colors.green),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'My add'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adds'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility), label: 'Provider'),
          ]),
      body: Pages[_currentindex],
    );
  }
}
