import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/Pages/chat.dart';
import 'package:myapp/bottom_nav_controller.dart';
import 'package:myapp/secondscreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Box box = await Hive.openBox('Contact-list');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/First-screen': (context) => Chat(),
        '/Second-screen': (context) => secondscreen(),
      },
      theme: ThemeData(
          brightness: Brightness.light,
          textTheme:
              GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply()),
          primarySwatch: Colors.blue,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))))),
      home: BottomNavController(),
    );
  }
}
