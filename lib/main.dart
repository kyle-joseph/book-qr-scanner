// @dart=2.9

import 'package:book_qr_scanner/screens/home/home.dart';
import 'package:book_qr_scanner/screens/scan/scan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VTrace',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/scan': (context) => ScanComplete(),
        // '/scanned': (context) => ScannedQR(),
      },
    );
  }
}
