import 'package:flutter/material.dart';
import 'package:fluttersandbox2018/CustomClipper/WaveClipper.dart';
import 'package:fluttersandbox2018/FlightApp/CustomShapeClipper.dart';
import 'package:fluttersandbox2018/GreenChangeApp/Widget/CurrencyDropDown.dart';
import 'package:fluttersandbox2018/Styles/AppStyleExport.dart';

Color firstColor = Color(0xFFEF772C);
Color secondColor = Color(0xFFEF772C);

class GreenChangeNearByScreen extends StatefulWidget {
  GreenChangeNearByScreen({Key key}) : super(key: key);

  @override
  _GreenChangeNearByScreenState createState() =>
      new _GreenChangeNearByScreenState();
}

class _GreenChangeNearByScreenState extends State<GreenChangeNearByScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              color: Color(0xFF2541BE),
            ),
          ),
          Positioned.fill(
            child: SizedBox(
              height: 200.0,
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [firstColor, secondColor],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 80.0,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          new Positioned(
              top: 200.0,
              left: 24.0,
              child: new Row(
                children: <Widget>[
                  new Text(
                    "Available Changes",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Ubuntu",
                      letterSpacing: 0.64,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  AppWidget.SizeBoxW60,
                ],
              )),
          new Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: AppDecoration.BorderRadius35Whites,
              width: double.infinity,
              height: 470.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      AppWidget.SizeBoxH30,
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: <BoxShadow>[
                                    new BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                        offset: new Offset(0.0, 1.0)),
                                  ],
                                ),
                                child: IconButton(
                                    color: Colors.white,
                                    icon: Icon(
                                      Icons.settings,
                                      color: Colors.blue,
                                    ),
                                    onPressed: null),
                              ),
                              SizedBox(width: 5.0),
                              Container(
                                width: 105,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: <BoxShadow>[
                                    new BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                        offset: new Offset(0.0, 1.0)),
                                  ],
                                ),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(Icons.location_on),
                                        onPressed: null),
                                    new Text(
                                      "Nearby",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Ubuntu",
                                        letterSpacing: 0.4,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 160,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: <BoxShadow>[
                                    new BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                        offset: new Offset(0.0, 1.0)),
                                  ],
                                ),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(Icons.star),
                                        onPressed: null),
                                    new Text(
                                      "High Rate",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Ubuntu",
                                        letterSpacing: 0.4,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            _buildCard("Tony"),
                            AppWidget.SizeBoxH10,
                            _buildCard("John"),
                            AppWidget.SizeBoxH10,
                            _buildCard("Mary"),
                            AppWidget.SizeBoxH10,
                            _buildCard("Mary"),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          new Positioned(
            top: 230.0,
            left: 24.0,
            child: new Container(
                width: 327,
                height: 40,
                decoration: new BoxDecoration(
                  color: Color(0xFFF9B515),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: new Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search, color: Colors.white),
                      onPressed: null,
                      color: Colors.white,
                    ),
                    new Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Ubuntu",
                        letterSpacing: 0.4,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  _buildCard(username) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20),
      child: new Container(
          width: 320,
          height: 163,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 13, top: 18),
                    child: new Container(
                        width: 30,
                        height: 30,
                        decoration:
                            AppDecoration.BorderRadiusAll30ImageBackground(
                                AppImage.EmmWatson),
                        child: new Container()),
                  ),
                  AppWidget.SizeBoxW20,
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "${username}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Ubuntu",
                          letterSpacing: 0.48,
                          color: Color(0xFF181818),
                        ),
                      ),
                      SizedBox(width: 130.0),
                      Column(
                        children: <Widget>[
//                            IconButton(
//                                icon: Icon(Icons.location_on),
//                                onPressed: null
//                            ),
                          new Text(
                            "0.5km Times Square",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Ubuntu-Regular",
                              letterSpacing: 0.48,
                              color: Color(0xFF181818),
                            ),
                          ),
                          SizedBox(width: 83.0),
                        ],
                      ),
                    ],
                  ),
                  AppWidget.SizeBoxW80,
                  new Column(children: <Widget>[
                    new Text('*****'),
                    new Text(
                      "20mins",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Ubuntu-Regular",
                        letterSpacing: 0.58,
                        color: Color(0xFF919191),
                      ),
                    ),
                  ])
                ],
              ),
              SizedBox(height: 16.5),
              Container(
                width: 320,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(height: 11.5),
              Row(
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: new Text(
                          "Offer",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Ubuntu-Regular",
                            letterSpacing: 0.58,
                            color: Color(0xFF919191),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
//                        IconButton(
//                            icon: Icon(Icons.attach_money, color: Colors.red,),
//                            onPressed: null
//                        ),
                          SizedBox(width: 16.0),
                          new Text(r'$'),
                          new Text(
                            "10000 USD",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Ubuntu",
                              letterSpacing: 0.4,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 42.0),
//                    IconButton(
//                        icon: Icon(Icons.compare_arrows),
//                        onPressed: null
//                    ),
                  SizedBox(width: 38.0),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: new Text(
                          "Receive",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Ubuntu-Regular",
                            letterSpacing: 0.58,
                            color: Color(0xFF919191),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: <Widget>[
//                        IconButton(
//                            icon: Icon(Icons.attach_money, color: Colors.red,),
//                            onPressed: null
//                        ),
                            SizedBox(width: 16.0),
                            new Text(r'$'),
                            new Text(
                              "10000 HKD",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Ubuntu",
                                letterSpacing: 0.4,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppWidget.SizeBoxH10,
              new Container(
                  width: 380,
                  height: 35,
                  decoration: new BoxDecoration(
                    color: Color(0xFFF4F6FF),
                    borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 50),
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          "W",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Ubuntu",
                            letterSpacing: 0.4,
                            color: Color(0xFF415AC9),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        new Text(
                          "1:8.66",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Ubuntu-Regular",
                            letterSpacing: 0.48,
                            color: Color(0xFF181818),
                          ),
                        ),
                        SizedBox(width: 20.0),
                        new Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Ubuntu",
                            letterSpacing: 0.4,
                            color: Color(0xFF415AC9),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        new Text(
                          "100 USD",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Ubuntu-Regular",
                            letterSpacing: 0.48,
                            color: Color(0xFF181818),
                          ),
                        ),
                        SizedBox(width: 45.0),
                        new Text(
                          "Flexible",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Ubuntu-Regular",
                            letterSpacing: 0.48,
                            color: Color(0xFF181818),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
