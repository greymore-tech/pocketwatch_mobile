// @dart=2.9
import 'package:pocketwatch_mobile/utils/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer {
  Widget footer() {
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: EdgeInsets.only(bottom: 5.0, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "© 2022 pocketwatch",
              textScaleFactor: 1,
              style: TextStyle(
                fontSize: 1.5 * SizeConfig.textMultiplier,
                color: Colors.grey[600],
                fontFamily: 'Nunito',
              ),
            ),
            RichText(
                textAlign: TextAlign.center,
                textScaleFactor: 1,
                text: TextSpan(
                    text: '  Powered by ',
                    style: TextStyle(
                      fontSize: 1.4 * SizeConfig.textMultiplier,
                      color: Colors.grey[600],
                      fontFamily: 'Nunito',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Greymore Tech',
                          style: TextStyle(
                            fontSize: 1.5 * SizeConfig.textMultiplier,
                            color: Colors.teal[700],
                            fontFamily: 'Nunito',
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              const url = "https://greymore.tech";
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Failed to launch Url , Please check your Internet Connection");
                              }
                            })
                    ])),
          ],
        ),
      ),
    );
  }
}
