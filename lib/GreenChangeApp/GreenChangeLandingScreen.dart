import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersandbox2018/Styles/AppIcon.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Bloc/FirebaseIOBloc/FirebaseIOBlocExport.dart';
import '../Bloc/FirebaseAuthBloc/FirebaseAuthExport.dart';
import '../Bloc/GloabBloc/GlobalBloc.dart';
import 'package:stripe_payment/stripe_payment.dart';
import './Chat/GreenChanageChatMainScreen.dart';
import './GreenChangeNearByScreen.dart';
import './GreenChangeChangeScreen.dart';
import './GreenChangeProfileScreen.dart';
import '../Styles/AppStyleExport.dart';

Color firstColor = Color(0xFFEF772C);
Color secondColor = Color(0xFFEF772C);

class GreenChangeLandingScreen extends StatefulWidget {
  GreenChangeLandingScreen({Key key}) : super(key: key);

  @override
  _GreenChangeLandingScreenState createState() =>
      new _GreenChangeLandingScreenState();
}

class _GreenChangeLandingScreenState extends State<GreenChangeLandingScreen> {
  List<StatefulWidget> _screenchildren = [
    GreenChangeChangeScreen(),
    GreenChangeNearByScreen(),
    GreenChanageChatMainScreen(),
    GreenChangeProfileScreen()
  ];

  var _selectIndex = 0;

  @override
  void initState() {
//    StripeSource.setPublishableKey(AppConfig.PublishableKeyXFlutterSandbox2018);

    //todo need to work onm the chatblog
//    BlocProvider.of<FirebaseIOBloc>(context).dispatch(InitDBEvent());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _screenchildren[_selectIndex],
      floatingActionButton: new SizedBox(
        width: 125.0,
        height: 42.0,
        child: globalBloc.isShowFab
            ? FloatingActionButton.extended(
                backgroundColor: Color(0xFF1032C6),
                elevation: 0.0,
                shape: AppShape.RoundBorderRadius30,
                icon: const Icon(
                  Icons.language,
                  size: 17.0,
                ),
                label: Text(
                  'Submit',
                  style: AppStyle.Avenir16White,
                ),
                onPressed: () {
                  Fluttertoast.showToast(msg: "Submitting..... ");
//                  BlocProvider.of<FirebaseAuthBloc>(context)
//                      .dispatch(GoogleSignOutEvent());
                },
              )
            : Container(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: AppColors.BrightOrgangeGM,
        currentIndex: _selectIndex,
        items: [
          new BottomNavigationBarItem(
            icon: new Image.asset(AppImage.greenchange_bottomnav_exchange),
            title: Container(),
          ),
          new BottomNavigationBarItem(
            icon: new Image.asset(AppImage.greenchange_bottomnav_location),
            title: Container(),
          ),
          new BottomNavigationBarItem(
            icon: new Image.asset(AppImage.greenchange_bottomnav_chat),
//              icon: new Image.asset(AppImage.gmApp_nav_chat),
            title: Container(),
          ),
          new BottomNavigationBarItem(
            icon: new Image.asset(AppImage.greenchange_bottomnav_setting),
            title: Container(),
          ),
        ],
        onTap: (int i) => setState(() {
              _selectIndex = i;
              if (_selectIndex == 0) {
                globalBloc.isShowFab = true;
              } else {
                globalBloc.isShowFab = false;
              }
            }),
      ),
    );
  }
}
