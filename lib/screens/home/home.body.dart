import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 70),
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
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  homeButton(context, 'Scan QR', '/scan', Icons.qr_code),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget homeButton(
      BuildContext context, String title, String route, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      height: 100,
      width: 210,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        color: Colors.white,
        onPressed: () async {
          await Navigator.popAndPushNamed(context, route);
        },
        icon: Icon(
          icon,
          size: 45,
          color: Color(0xff14A76C),
        ),
        label: Text(
          title,
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: Color(0xff14A76C),
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
