import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/FirebaseAuthBloc/FirebaseAuthExport.dart';
import './GreenChangeLandingScreen.dart';
import './GreenChangeSignUpScreen.dart';
import './GreenChangeSplashScreen.dart';
import '../Styles/AppStyleExport.dart';

//Make sure add chanage the key for the stripe
//Make sure add sources

class GreenChangeAppMain extends StatefulWidget {
  GreenChangeAppMain({Key key}) : super(key: key);

  @override
  _GreenChangeAppMainState createState() => new _GreenChangeAppMainState();
}

class _GreenChangeAppMainState extends State<GreenChangeAppMain> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuthBloc _firebaseAuthBloc =
        BlocProvider.of<FirebaseAuthBloc>(context);
    return BlocBuilder(
        bloc: _firebaseAuthBloc,
        builder: (BuildContext context, FirebaseAuthState state) {
          if (state is AppStartedState) {
            return GreenSplashScreen();
          }
          if (state is NotAuthenticated) {
            return GreenChangeSignUpScreen();
          }
          if (state is Authenticated) {
            return GreenChangeLandingScreen();
          } else {
            return GreenChangeSignUpScreen();
          }
        });
  }
}
