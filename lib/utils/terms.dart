// @dart=2.9
import 'dart:convert';

import 'package:pocketwatch_mobile/network_module/api_path.dart';
import 'package:pocketwatch_mobile/network_module/http_client.dart';
import 'package:pocketwatch_mobile/utils/size_config.dart';
import 'package:pocketwatch_mobile/utils/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  final Color backgroundColor = Colors.redAccent;
  var source = false;
  var nodata = false;
  var htmlData;
  void initState() {
    _getTerms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: BaseAppBar(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                    top: 2.20 * SizeConfig.heightMultiplier,
                    bottom: 1 * SizeConfig.heightMultiplier),
                child: Text(
                  'Terms of Service & Privacy Policy',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 2.94 * SizeConfig.textMultiplier,
                      // fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[700]),
                ),
              ),
              Material(
                child: Center(
                  child: source
                      ? Padding(
                          padding: EdgeInsets.all(
                              1.22 * SizeConfig.heightMultiplier),
                          child: Html(data: htmlData),
                        )
                      : Center(
                          child: nodata
                              ? Column(
                                  children: <Widget>[
                                    Container(
                                        height:
                                            49.01 * SizeConfig.heightMultiplier,
                                        child: SvgPicture.asset(
                                            "assets/images/nodata.svg")),
                                    Container(
                                      child: Text(
                                          "Terms of Service and Privacy Policy Not Found"),
                                    )
                                  ],
                                )
                              : CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getTerms() async {
    final res = await HttpClient.instance
        .fetchTerms(APIPathHelper.getValue(APIPath.terms));
    if (res.statusCode == 200) {
      print(res.body);
      if (res.body == "" && res.body != null) {
        if (mounted) {
          setState(() {
            nodata = true;
          });
        }
      } else {
        var body = json.decode(res.body);
        if (mounted) {
          setState(() {
            source = true;
            htmlData = body['terms'];
          });
        }
      }
    }
  }
}
