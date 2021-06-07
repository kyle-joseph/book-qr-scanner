import 'package:book_qr_scanner/screens/scan/scan.body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanComplete extends StatelessWidget {
  final String bookTitle;

  ScanComplete(this.bookTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff14A76C),
        elevation: 0,
        title: Text(
          'Scan Complete',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: ScanCompleteBody('Book Title'),
    );
  }
}
