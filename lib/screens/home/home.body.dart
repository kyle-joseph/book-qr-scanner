import 'package:book_qr_scanner/screens/scan/scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String _scanBarcode = 'Unknown';

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Widget scanButton(BuildContext context, String title, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      height: 85,
      width: 210,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        color: Color(0xff14A76C),
        onPressed: () async {
          await scanQR();
          await Navigator.pushNamed(context, '/scan', arguments: _scanBarcode);
        },
        icon: Icon(
          icon,
          size: 45,
          color: Colors.white,
        ),
        label: Text(
          title,
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 100),
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(50, 20, 50, 50),
            decoration: BoxDecoration(
                color: Color(0xff14A76C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
            child: Text(
              "BOOK SCANNER",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 50,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  scanButton(context, 'Scan QR', Icons.qr_code),
                ],
              ),
            ),
          )
        ],
      ),
      // ),
    );
  }
}
