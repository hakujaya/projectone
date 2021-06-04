import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_ras/tabbar.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    print(sizeWidth / 15);
    print(sizeWidth);
    print(sizeHeight);
    return Scaffold(
      backgroundColor: Color(0xff66d68f),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff66d68f),
        elevation: 0.0,
        title: Text(
          'Risda Accounting System',
          style: TextStyle(
            fontSize: 30.0,
            shadows: [
              Shadow(
                blurRadius: 8.0,
                color: Colors.black.withOpacity(0.3),
              )
            ],
            fontFamily: 'Poppins',
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: sizeHeight / 4.6,
            width: sizeWidth,
            color: Color(0xff66d68f),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: sizeWidth / 15,
                  ),
                  width: sizeWidth * 1 / 4,
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage('images/avatar.png'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: sizeHeight / 14, left: 10.0),
                  width: sizeWidth * 3 / 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mohd Saufi Syafiq',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: sizeWidth / 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Hakujaya Technologies',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: sizeWidth / 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: sizeHeight * 1 / 13),
                width: sizeWidth,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, -2), // Shadow position
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: sizeHeight * 1 / 20,
                          bottom: sizeHeight * 1 / 30),
                      child: Text(
                        'Pendapatan bulanan',
                        style: TextStyle(
                            fontSize: sizeWidth * 1 / 23,
                            color: Colors.black.withOpacity(0.7)),
                      ),
                    ),
                    Text(
                      'RM 1850.00',
                      style: TextStyle(
                          fontSize: sizeWidth * 1 / 12, color: Colors.green),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return Tabbar();
                                }),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green.withOpacity(0.3),
                                      blurRadius: 10,
                                      spreadRadius: 3.0,
                                      offset: Offset(0, 0), // Shadow position
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              height: sizeHeight / 6,
                              width: sizeWidth / 3,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    height: sizeHeight * 1 / 15,
                                    fit: BoxFit.contain,
                                    image: AssetImage('assets/tunaimasuk.png'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: sizeHeight * 1 / 50),
                                    child: Text("Tunai Masuk"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.deepOrangeAccent
                                        .withOpacity(0.3),
                                    blurRadius: 10,
                                    spreadRadius: 3.0,
                                    offset: Offset(0, 0), // Shadow position
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            height: sizeHeight / 6,
                            width: sizeWidth / 3,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  height: sizeHeight * 1 / 15,
                                  fit: BoxFit.contain,
                                  image: AssetImage('assets/tunaikeluar.png'),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: sizeHeight * 1 / 50),
                                  child: Text("Tunai Keluar"),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 3.0,
                                  offset: Offset(0, 0), // Shadow position
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          height: sizeHeight / 6,
                          width: sizeWidth / 3,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                height: sizeHeight * 1 / 15,
                                fit: BoxFit.contain,
                                image: AssetImage('assets/ledger.png'),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: sizeHeight * 1 / 50),
                                child: Text("Ringkasan Lejer"),
                              )
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Colors.lightBlueAccent.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 3.0,
                                  offset: Offset(0, 0), // Shadow position
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          height: sizeHeight / 6,
                          width: sizeWidth / 3,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                height: sizeHeight * 1 / 15,
                                fit: BoxFit.contain,
                                image: AssetImage('assets/bukutunai.png'),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: sizeHeight * 1 / 50),
                                child: Text("Buku Tunai"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
