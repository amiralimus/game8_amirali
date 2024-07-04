import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'first_page/first_page.dart'; //to start the app

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized(); //to have a Horizontal app
  SystemChrome.setPreferredOrientations([
    //to have a Horizontal app
    DeviceOrientation.landscapeRight, //to have a Horizontal app
    DeviceOrientation.landscapeLeft, //to have a Horizontal app
  ]);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const FirstPage(); //first page of the app
  }
}
