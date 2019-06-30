import 'package:flutter/material.dart';
import 'package:fluttersandbox2018/CustomClipper/WaveClipper.dart';
import 'package:fluttersandbox2018/GreenChangeApp/Widget/CurrencyDropDown.dart';
import '../Bloc/GloabBloc/bloc_widget/UserAvator.dart';
import '../Bloc/GloabBloc/bloc_widget/UserDisplayName.dart';
import '../Styles/AppStyleExport.dart';
import './Widget/HairSavedStyleCard.dart';
import 'package:fluttersandbox2018/Bloc/Models/GmApp/HairSavedStyle.dart';
import '../Services/FireStoreServices.dart';
import '../Styles/AppColors.dart';
import '../Styles/AppDecoration.dart';
import '../Styles/AppStyle.dart';
import '../Styles/AppWidget.dart';
import 'GreenChangeChangeScreen.dart';

class GreenChangeProfileScreen extends StatefulWidget {
  GreenChangeProfileScreen({Key key}) : super(key: key);

  @override
  _GreenChangeProfileScreenState createState() =>
      new _GreenChangeProfileScreenState();
}

class _GreenChangeProfileScreenState extends State<GreenChangeProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var editingController;
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
            top: 160.0,
            left: 24.0,
            child: new Row(
              children: <Widget>[
                new Image.asset(AppImage.greenchange_chole,
                    width: 80.0, height: 80.0, fit: BoxFit.cover),
                AppWidget.SizeBoxW20,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "Khloe Chan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Ubuntu",
                        letterSpacing: 0.4,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    new Row(children: <Widget>[
                      AppWidget.BuildRatedStar(1, 5),
                      AppWidget.BuildRatedStar(2, 5),
                      AppWidget.BuildRatedStar(3, 5),
                    ]),
                    new Text(
                      "0.5km Times Square",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Ubuntu-Regular",
                        letterSpacing: 0.58,
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
                        new Container(
                            width: 147,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                                color: Color(0xFF5268C7),
                                borderRadius: BorderRadius.circular(17.5),
                                boxShadow: [
                                  new BoxShadow(
                                    color: Color(0xFF224AFB),
                                    offset: new Offset(0, 15),
                                    blurRadius: 15,
                                  ),
                                ]),
                            child: new Text(
                              "Recent offers (1)",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Ubuntu",
                                letterSpacing: 0.4,
                                color: Color(0xFFFFFFFF),
                              ),
                            )),
                        new Text(
                          "Past Exchanges (15)",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Ubuntu",
                            letterSpacing: 0.4,
                            color: Color(0xFF919191),
                          ),
                        )
                      ],
                    ),
                    AppWidget.SizeBoxH20,
                    AppWidget.Divider1Grey,
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          _buildCard("Tony"),
                          _buildCard("Money"),
                          _buildCard("Doneky"),
                          _buildCard("Gen"),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ],
    ));
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
