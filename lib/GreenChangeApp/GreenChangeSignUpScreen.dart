import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttersandbox2018/Bloc/FirebaseAuthBloc/bloc_Input/LoginEmailInputGreenChange.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Styles/AppStyleExport.dart';

class GreenChangeSignUpScreen extends StatefulWidget {
  @override
  _GreenChangeSignUpScreenState createState() =>
      _GreenChangeSignUpScreenState();
}

class _GreenChangeSignUpScreenState extends State<GreenChangeSignUpScreen> {
  bool isLoading = false;
  bool isLoggedIn = false;
  FirebaseUser currentUser;

  final formkey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  checkFields() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(25.0),
              child: new Form(
                key: formkey,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Wrap(
                      spacing: 8.0, // 主轴(水平)方向间距
                      runSpacing: 4.0, // 纵轴（垂直）方向间距
                      alignment: WrapAlignment.center, //沿主轴方向居中
                      children: <Widget>[
                        new Text("What is your email address?",
                            style: AppStyle.Avenir32DarkGm),
                      ],
                    ),
                    AppWidget.SizeBoxH15,
                    LoginEmailInputGreenChange(),
                    AppWidget.EmailError(),
                    AppWidget.SizeBoxH15,
                    AppWidget.PasswordInput(),
                    AppWidget.PasswordError(),
                    AppWidget.SizeBoxH15,
//                    AppWidget.EmailPassSignUpbtn(),
                    AppWidget.SizeBoxH10,
//                    AppWidget.EmailPassSignInbtn(),
                    Center(
                        child: new Text(
                      AppString.OrLoginWith,
                      style: AppStyle.Avenir12TroutGrey,
                    )),
                    AppWidget.SizeBoxH10,
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: IconButton(
                              iconSize: 26,
                              icon: Icon(FontAwesomeIcons.facebookSquare,
                                  color: AppColors.FaccebookBlue),
                              onPressed: () {}),
                        ),
                        AppWidget.SizeBoxW50,
                        Expanded(
                          child: AppWidget.GoogleSignInButtonLogo(),
                        ),
                      ],
                    ),
                    //Next Button
                    new Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: MaterialButton(
                        minWidth: 500.0,
                        height: 40.0,
                        onPressed: () {},
                        color: AppColors.GreenChangeGreen,
                        child: Text('Next',
                            style: new TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
