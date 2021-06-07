import 'package:flutter/material.dart';
import 'package:book_qr_scanner/screens/home/home.body.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff14A76C),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: HomeBody(),
      ),
    );
  }
}
