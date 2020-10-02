// import 'package:flutter/material.dart';
// import 'package:sentia_mobile/size_config.dart';

// class AppTheme {
//   AppTheme._();

//   static Color appBackgroundColor = Colors.grey[100];
//   static  Color topBarBackgroundColor = Colors.white;
//   static const Color selectedTabBackgroundColor = Color(0xFFFFC442);
//   static const Color unSelectedTabBackgroundColor = Color(0xFFFFFFFC);
//   static const Color subTitleTextColor = Color(0xFF9F988F);

//   static final ThemeData lightTheme = ThemeData(
//     scaffoldBackgroundColor: AppTheme.appBackgroundColor,
//     brightness: Brightness.light,
//     textTheme: lightTextTheme,
//   );

//   static final TextTheme lightTextTheme = TextTheme(
//    // ignore: deprecated_member_use
//     title: _titleLight,
//     // ignore: deprecated_member_use
//     subtitle:_subTitleLight,
//     button: _buttonLight,
//     // ignore: deprecated_member_use
//     display1: _greetingLight,
//     // ignore: deprecated_member_use
//     display2: _searchLight,
//     // ignore: deprecated_member_use
//     body1: _selectedTabLight,
//     // ignore: deprecated_member_use
//     body2: _unSelectedTabLight,
//   );



//   static final TextStyle _titleLight = TextStyle(
//     fontFamily: 'IBM-Plex-sans',
//     fontSize: 3.5 * SizeConfig.textMultiplier,
//     fontWeight: FontWeight.bold,
//     color: Colors.blueGrey[900]
//   );


//   static final TextStyle _subTitleLight = TextStyle(
//     color: subTitleTextColor,
//     fontFamily: 'IBM-Plex-sans',
//     fontSize: 2 * SizeConfig.textMultiplier,
//     height: 1.5,
//   );

//   static final TextStyle _buttonLight = TextStyle(
//     fontWeight: FontWeight.bold,
//     color: Colors.white,
//     fontFamily: 'IBM-Plex-sans',
//     fontSize: 2 * SizeConfig.textMultiplier,
//   );

//   static final TextStyle _greetingLight = TextStyle(
//     color: Colors.black,
//     fontFamily: 'IBM-Plex-sans',
//     fontSize: 2.0 * SizeConfig.textMultiplier,
//   );

//   static final TextStyle _searchLight = TextStyle(
//     color: Colors.black,
//     fontFamily: 'IBM-Plex-sans',
//     fontSize: 2.3 * SizeConfig.textMultiplier,
//   );

//   static final TextStyle _selectedTabLight = TextStyle(
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'IBM-Plex-sans',
//     fontSize: 2 * SizeConfig.textMultiplier,
//   );

//   static final TextStyle _unSelectedTabLight = TextStyle(
//     color: Colors.grey,
//     fontFamily: 'IBM-Plex-sans',
//     fontSize: 2 * SizeConfig.textMultiplier,
//   );


// }