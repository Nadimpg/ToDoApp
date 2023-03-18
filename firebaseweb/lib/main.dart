import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseweb/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyABtf4lgurzSo0T9_S7KAtaHEVrr2ZuoYU",
          appId: '20fb61193cc4256eac9b3f',
          messagingSenderId: '110973151918',
          projectId: 'firstfp-df3b3'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
