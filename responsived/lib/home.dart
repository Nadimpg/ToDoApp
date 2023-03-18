import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(builder: (context, orientaion) {
      if (orientaion == Orientation.landscape) {
        return LandsCape();
      } else {
        return Potrait();
      }
    }));
  }
}

class LandsCape extends StatelessWidget {
  const LandsCape({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'LandsCape',
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}

class Potrait extends StatelessWidget {
  const Potrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'Potrait',
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}
