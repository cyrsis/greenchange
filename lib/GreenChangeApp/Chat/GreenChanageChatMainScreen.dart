import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttersandbox2018/CustomClipper/WaveClipper.dart';
import 'package:fluttersandbox2018/GreenChangeApp/Widget/CurrencyDropDown.dart';
import '../../Bloc/GloabBloc/GlobalBloc.dart';
import '../GreenChangeChangeScreen.dart';
import './chat.dart';
import '../../Styles/AppStyleExport.dart';

class GreenChanageChatMainScreen extends StatefulWidget {
  GreenChanageChatMainScreen({Key key}) : super(key: key);

  @override
  State createState() => GreenChanageChatMainScreenState();
}

class GreenChanageChatMainScreenState
    extends State<GreenChanageChatMainScreen> {
  GreenChanageChatMainScreenState({
    Key key,
  });

  @override
  Future initState() {
    super.initState();
    initUser();
  }

  String currentUserUID;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: Stack(
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
                top: 200.0,
                left: 24.0,
                child: new Row(
                  children: <Widget>[
                    new Text(
                      "Message",
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
                  child: new Stack(
                    children: <Widget>[
                      new Container(
                        child: StreamBuilder(
                          stream: AppStream.userSnapShot,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.themeColor),
                                ),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: snapshot.data.documents.length,
                                padding: EdgeInsets.all(10.0),
                                itemBuilder: (context, index) => _buildItem(
                                    context, snapshot.data.documents[index]),
                              );
                            }
                          },
                        ),
                      ),

                      // Loading
                      Positioned(
                        child: isLoading
                            ? Container(
                                child: Center(
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          AppColors.themeColor)),
                                ),
                                color: Colors.white.withOpacity(0.8),
                              )
                            : Container(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        onWillPop: onBackPress,
      ),
    );
  }

  Future<bool> onBackPress() {
    Navigator.pop(context);
//    /openDialog();
    return Future.value(false);
  }

  Widget _buildItem(BuildContext context, DocumentSnapshot document) {
    if (document['uid'] == currentUserUID) {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    } else {
      return Container(
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Material(
                child: CachedNetworkImage(
                  placeholder: Container(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.themeColor),
                    ),
                    width: 38.0,
                    height: 38.0,
                    padding: AppPadding.Left15,
                  ),
                  imageUrl: document['photoUrl'] ?? "",
                  width: 38.0,
                  height: 38.0,
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                clipBehavior: Clip.hardEdge,
              ),
              Flexible(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '${document['displayName']}',
                          style: AppStyle.Avenir16Dark,
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                      ),
                      Container(
                        child: Text(
                          'About me: ${document['aboutMe'] ?? 'Not available'}',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(left: 20.0),
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Chat(
                          peerId: document.documentID,
                          peerDisplayName: document['displayName'],
                          peerAvatar: document['photoUrl'],
                        )));
          },
          padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
          shape: AppShape.RoundBorderRadius10,
        ),
        margin: EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
      );
    }
  }

  initUser() {
//    user = globalBloc.User;
//    print(' GlobalBloc user ${user.uid}');
//    currentUserId = user.uid;
    currentUserUID = globalBloc.User.uid;
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}
