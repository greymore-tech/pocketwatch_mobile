import 'package:flutter/material.dart';
import 'package:pocketwatch_mobile/route/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
     return LayoutBuilder(
      builder: (context,constraints){
        return OrientationBuilder(
          builder: (context,orientation){
            // SizeConfig().init(constraints, orientation);
            return MaterialApp(
              initialRoute: '/',
              onGenerateRoute: RouteGenerator.generateRoute,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: "Nunito",
                primarySwatch: Colors.blue,
              ),
            );
          },
        );
      },
    );
  }
}

