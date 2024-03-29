import 'package:flutter/material.dart';
import 'package:pocketwatch_mobile/utils/size_config.dart';

class AppTheme {
  AppTheme._();
  static Color appBackgroundColor = Colors.white;
  static Color topBarBackgroundColor = Colors.white;
  static const Color selectedTabBackgroundColor = Color(0xFFFFC442);
  static const Color unSelectedTabBackgroundColor = Color(0xFFFFFFFC);
  static const Color subTitleTextColor = Color(0xFF9F988F);

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppTheme.appBackgroundColor,
      // brightness: Brightness.light,
      textTheme: lightTextTheme,
      buttonTheme: buttonTheme,
      // primarySwatch: Colors.pink,
      canvasColor: Colors.grey[100]);

  static final TextTheme lightTextTheme = TextTheme(
    headline6: _titleLight,
    subtitle1: _subHeading,
    subtitle2: _subDisplayHeading,
    bodyText1: _bodyText1,
    bodyText2: _bodyText2,
    button: _buttonLight,
  );
  static final ButtonThemeData buttonTheme = ButtonThemeData(
    // minWidth: 100,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    buttonColor: Color.fromRGBO(0, 51, 52, 1),
    padding: EdgeInsets.all(0.98*SizeConfig.heightMultiplier),
  );
  static final TextStyle _titleLight = TextStyle(
      fontSize: 2.5 * SizeConfig.textMultiplier,
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey.shade900);

  static final TextStyle _subHeading = TextStyle(
    color: Colors.blueGrey.shade400,
    fontWeight: FontWeight.w800,
    fontSize: 2.2 * SizeConfig.textMultiplier,
  );
  static final TextStyle _subDisplayHeading = TextStyle(
    color: Colors.blueGrey.shade400,
    fontSize: 2 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle _bodyText1 = TextStyle(
    color: Colors.grey.shade800,
    fontSize: 1.9 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle _bodyText2 = TextStyle(
    color: Colors.grey[700],
    fontSize: 1.6 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.w600,
  );
  // static final TextStyle _subTitleLight = TextStyle(
  //   color: subTitleTextColor,
  //   fontFamily: 'Nunito',
  //   fontSize: 2 * SizeConfig.textMultiplier,
  //   height: 1.5,
  // );

  static final TextStyle _buttonLight = TextStyle(
    fontSize: 1.6 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // static final TextStyle _greetingLight = TextStyle(
  //   color: Colors.black,
  //   fontFamily: 'Nunito',
  //   fontSize: 2.0 * SizeConfig.textMultiplier,
  // );

  // static final TextStyle _searchLight = TextStyle(
  //   color: Colors.black,
  //   fontFamily: 'Nunito',
  //   fontSize: 2.3 * SizeConfig.textMultiplier,
  // );

  // static final TextStyle _selectedTabLight = TextStyle(
  //   color: Colors.black,
  //   fontWeight: FontWeight.bold,
  //   fontFamily: 'Nunito',
  //   fontSize: 2 * SizeConfig.textMultiplier,
  // );

  // static final TextStyle _unSelectedTabLight = TextStyle(
  //   color: Colors.grey,
  //   fontFamily: 'Nunito',
  //   fontSize: 2 * SizeConfig.textMultiplier,
  // );
}
