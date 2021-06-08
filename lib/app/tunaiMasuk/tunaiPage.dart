import 'package:flutter/material.dart';
import 'package:project_ras/app/tunaiMasuk/jualanPage.dart';

class TunaiPage extends StatefulWidget {
  @override
  _TunaiPageState createState() => _TunaiPageState();
}

class _TunaiPageState extends State<TunaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        centerTitle: true,
        elevation: 10.0,
        title: Text(
          "TUNAI MASUK",
          style: TextStyle(
              fontStyle: FontStyle.normal, fontSize: 20, color: Colors.white),
        ),
      ),
      body: _buildcontent(context),
    );
  }
}

// design Tunai Page
Widget _buildcontent(BuildContext context) {
  final sizeWidth = MediaQuery.of(context).size.width;
  final sizeHeight = MediaQuery.of(context).size.height;
  print(sizeWidth);
  print(sizeHeight);
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(
        left: sizeWidth * 1 / 13,
        right: sizeWidth * 1 / 13,
        top: sizeHeight * 1 / 13,
        bottom: sizeHeight * 1 / 13),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: sizeHeight * 1 / 13,

          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () => JualanDetailPage.show(context, "JUALAN"),
            color: Colors.green[200],
            colorBrightness: Brightness.light,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Text(
              "JUALAN",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: sizeHeight * 1 / 13,
        ),
        SizedBox(
          height: sizeHeight * 1 / 13,

          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () => JualanDetailPage.show(context, "DEPOSIT JUALAN"),
            color: Colors.green[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Text(
              "DEPOSIT JUALAN",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: sizeHeight * 1 / 13,
        ),
        SizedBox(
            height: sizeHeight * 1 / 13,

            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () =>
                  JualanDetailPage.show(context, "PULANGAN BELIAN"),
              color: Colors.green[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              padding: EdgeInsets.only(right: 5.0, bottom: 1.0, top: 1.0),
              child: Text(
                "PULANGAN BELIAN",
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            )),
        SizedBox(
          height: sizeHeight * 1 / 13,
        ),
        SizedBox(
          height: sizeHeight * 1 / 13,

          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () => JualanDetailPage.show(context, "HASIL SEWAAN"),
            color: Colors.green[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Text(
              "HASIL SEWAAN",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: sizeHeight * 1 / 13,
        ),
        SizedBox(
          height: sizeHeight * 1 / 13,

          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () => JualanDetailPage.show(context, "LAIN-LAIN"),
            color: Colors.green[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Text(
              "LAIN-LAIN",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}
