import 'package:fazztrack_batch1/UI/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'UI/view/MyHomePage.dart';
import 'UI/view/SecondPage.dart';
import 'UI/view/login.dart';
import 'UI/view/signup.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "NunitoSans"),
      // home: login(),
      initialRoute: '/',
      routes: {
        "/": (context) => login(),
        "/homePage": (context) => MyHomePage(),
        "/secondPage": (context) => SecondPage(),
        "/signIn": (context) => signUp(),
      },
    );
  }
}
