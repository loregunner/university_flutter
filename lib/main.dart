import 'package:flutter/material.dart';
import 'package:tyba_prueba/DetailData.dart';
import 'package:tyba_prueba/MyhomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/':(context) => MyHomePage(),
        '/detailPage':(context) => MyDetailData()
      },
    );
  }
}
