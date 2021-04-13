import 'package:calculadora/pages/calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 14,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text(
          'Loading...',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white),
        ),
        image: new Image.asset('assets/images/calculadoragid.gif'),
        backgroundColor: Colors.black,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 200.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.amberAccent[700]);
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.deepPurple,
      ),
      home: CalculatorPage(),
    );
  }
}
