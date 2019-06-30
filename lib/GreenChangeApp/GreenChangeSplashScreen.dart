import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/FirebaseAuthBloc/FirebaseAuthExport.dart';
import './GreenChangeLandingScreen.dart';
import '../Styles/AppImage.dart';
import '../Util/AppUtils.dart';

class GreenSplashScreen extends StatefulWidget {
  @override
  _GreenSplashScreenState createState() => new _GreenSplashScreenState();
}

class _GreenSplashScreenState extends State<GreenSplashScreen> {
  startTime() async {
    return new Timer(new Duration(seconds: 2), () {
      BlocProvider.of<FirebaseAuthBloc>(context).dispatch(AppStartedEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFEF772C),
      body: new Center(
        child: new Image.asset(AppImage.greenchangelogo),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //startTime();

    BlocProvider.of<FirebaseAuthBloc>(context).dispatch(AppStartedEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
