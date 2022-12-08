import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MyHomePage.dart';
import 'SecondPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      // statusBarBrightness: Brightness.light,
      statusBarColor: Color.fromARGB(0, 247, 239, 239),
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
