import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScanCompleteBody extends StatefulWidget {
  final String bookTitle;
  const ScanCompleteBody(this.bookTitle);

  @override
  _ScanCompleteBodyState createState() => _ScanCompleteBodyState();
}

class _ScanCompleteBodyState extends State<ScanCompleteBody> {
  Widget confirmCancelButton(BuildContext context, String title, IconData icon,
      Color color, String action) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 60,
      width: 160,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        color: color,
        onPressed: () {
          if (action == 'confirm') {
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: "${widget.bookTitle} has been confirmed as returned",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: color,
                textColor: Colors.white,
                fontSize: 16.0);
          } else if (action == 'cancel') {
            Navigator.pop(context);
          }
        },
        icon: Icon(
          icon,
          size: 35,
          color: Colors.white,
        ),
        label: Text(
          title,
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/books.png',
                    filterQuality: FilterQuality.high,
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 30,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Book Title:",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: Color(0xff14A76C),
                                fontWeight: FontWeight.w800,
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            widget.bookTitle,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: Color(0xff888888),
                                fontWeight: FontWeight.w800,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        confirmCancelButton(context, 'Confirm',
                            Icons.check_circle, Color(0xff14A76C), 'confirm'),
                        confirmCancelButton(context, 'Cancel', Icons.cancel,
                            Color(0xffFC4445), 'cancel'),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
