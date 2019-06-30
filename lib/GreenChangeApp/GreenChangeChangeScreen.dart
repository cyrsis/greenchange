import 'package:flutter/material.dart';
import 'package:fluttersandbox2018/CustomClipper/WaveClipper.dart';
import 'package:fluttersandbox2018/FlightApp/CustomShapeClipper.dart';
import 'package:fluttersandbox2018/GreenChangeApp/Widget/CurrencyDropDown.dart';
import 'package:fluttersandbox2018/GreenChangeApp/Widget/CurrencyDropDownTarget.dart';
import 'package:fluttersandbox2018/GreenChangeApp/Widget/CurrencyDropDownTarget.dart';
import 'package:fluttersandbox2018/Styles/AppStyleExport.dart';

Color firstColor = Color(0xFFEF772C);
Color secondColor = Color(0xFFEF772C);

class GreenChangeChangeScreen extends StatefulWidget {
  GreenChangeChangeScreen({Key key}) : super(key: key);

  @override
  _GreenChangeChangeScreenState createState() =>
      new _GreenChangeChangeScreenState();
}

class _GreenChangeChangeScreenState extends State<GreenChangeChangeScreen> {
  final _textController = TextEditingController();

  double answer = 0.0;

  @override
  void initState() {
    super.initState();

    _textController.addListener(() {
      print("value: ${_textController.text}");
      //use setState to rebuild the widget
      answer = double.tryParse(_textController.text) * 7.8;
      setState(() {});
    });
  }

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
                  height: 200.0,
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
                      Text(
                        'Have the coins \nin you pocket ?',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
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
                    "Change",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Ubuntu",
                      letterSpacing: 0.64,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  AppWidget.SizeBoxW60,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        "Live Exchange Rate",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Ubuntu-Regular",
                          letterSpacing: 0.4,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      new Text(
                        "0.13",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Ubuntu",
                          letterSpacing: 0.4,
                          color: Color(0xFFFFFFFF),
                        ),
                      )
                    ],
                  )
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: AppDecoration.BorderRadius35Whites,
              width: double.infinity,
              height: 480.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      AppWidget.SizeBoxH20,
                      new Row(
                        children: <Widget>[
                          AppWidget.VerticalDividerLineDark12Blue,
                          AppWidget.SizeBoxW5,
                          new Text(
                            "Enter the amount of money to be exchanged.",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Avenir",
                              letterSpacing: 0.13,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                      AppWidget.SizeBoxH20,
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: CurrencyDropDown(),
                      ),
                      AppWidget.SizeBoxH20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            width: 185,
                            height: 68,
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                              color: Color(0xFFF3F4F7),
                              borderRadius: BorderRadius.circular(34),
                            ),

                            child: TextField(
                              controller: _textController,
                              decoration: InputDecoration(
                                hintText: '0.0',
                                hintStyle: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Ubuntu",
                                  color: Color(0xFF000000),
                                ),
                                contentPadding: EdgeInsets.only(left: 45),
                                border: InputBorder.none,
//                              contentPadding:
//                                  EdgeInsets.only(left: 15.0, top: 15.0),
                              ),
                              onChanged: (text) {
                                print("text $text");
                              },
                            ),
//                            child: new Text(
//                              "7,100",
//                              style: TextStyle(
//                                fontSize: 32,
//                                fontWeight: FontWeight.bold,
//                                fontFamily: "Ubuntu",
//                                color: Color(0xFF000000),
//                              ),
//                            ),
                          ),
                        ],
                      ),
                      AppWidget.SizeBoxH20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Image.asset(
                              AppImage.greenchange_bottomnav_exchange,
                              fit: BoxFit.cover),
                        ],
                      ),
                      AppWidget.SizeBoxH20,
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: CurrencyDropDownTarget(),
                      ),
                      AppWidget.SizeBoxH20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                              width: 185,
                              height: 68,
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                color: Color(0xFFF3F4F7),
                                borderRadius: BorderRadius.circular(34),
                              ),
                              child: new Text(
                                "${answer}",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Ubuntu",
                                  color: Color(0xFF000000),
                                ),
                              )),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
