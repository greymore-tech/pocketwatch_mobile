import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocketwatch_mobile/route/route_generator.dart';
import 'package:pocketwatch_mobile/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreen extends StatefulWidget {
  // final Color backgroundColor = Color.fromRGBO(34, 46, 72, 1.0);
  final Color backgroundColor = Colors.teal[300];
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  String _versionName = '';
  final splashDelay = 4;
  AnimationController animationController;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _loadWidget();
  }

  _loadWidget() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (mounted) {
      _versionName = packageInfo.version;
      setState(() {});
    }

    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var email = localStorage.getString('email');
    // if(email!=null){

    // Navigator.of(context).pushReplacementNamed(rootRoute);

    // }else{
    // Navigator.of(context).pushReplacementNamed();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 33.40 * SizeConfig.heightMultiplier,
                      width: 43 * SizeConfig.widthMultiplier,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                  ],
                )),
              ),
              // SizedBox(
              //         height: 2.11 * SizeConfig.heightMultiplier,
              //       ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    // CircularProgressIndicator(),
                    SpinKitSpinningLines(
                        color: Colors.redAccent,
                        size: 8.8*SizeConfig.imageSizeMultiplier,
                        controller: animationController),
                    SizedBox(
                      height: 2.11 * SizeConfig.heightMultiplier,
                    ),
                    Center(
                      // child: Image.asset("assets/images/logo_text.png",
                      //     height: 2.5 * SizeConfig.heightMultiplier),
                      child: Text(
                        "Pocket Watch",
                        style: Theme.of(context).textTheme.bodyText2.copyWith(color:Colors.blueGrey),
                      ),
                    ),
                    SizedBox(
                      height: 1.11 * SizeConfig.heightMultiplier,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Spacer(),
                          Text(_versionName),
                          // Spacer(
                          //   flex: 4,
                          // ),
                          // Text('androing'),
                          // Spacer(),
                        ])
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
