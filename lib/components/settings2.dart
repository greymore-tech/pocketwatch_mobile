import 'dart:convert';

// import 'package:pocketwatch_mobile/repositories/auth_repo.dart';
import 'package:pocketwatch_mobile/route/route_generator.dart';
import 'package:pocketwatch_mobile/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings2 extends StatefulWidget {
  // const Settings2({ Key? key }) : super(key: key);
  final flag;
  Settings2({
    Key key,
    @required this.flag,
  }) : super(key: key);

  @override
  _Settings2State createState() => _Settings2State();
}

class _Settings2State extends State<Settings2> {
  bool selected = false;
  bool _isUserLoggedIn = false;
  String email;
  String name;
  var mobile;
  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        _isUserLoggedIn = true;
        name = user['name'];
        email = user['email'];
        mobile = user['mobile'];
      });
    }
  }

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF006838),
        title: Text('Settings'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      // body: Theme(
      //   data: Theme.of(context).copyWith(
      //     brightness: Brightness.dark,
      //     primaryColor: Colors.purple,
      //   ),
      // child: DefaultTextStyle(
      //   style: TextStyle(
      //     color: Colors.white,
      //   ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4.21 * SizeConfig.heightMultiplier),
        child: Column(
          children: <Widget>[
            SizedBox(height: 3.95 * SizeConfig.heightMultiplier),
            Row(
              children: <Widget>[
                Container(
                  width: 15.30 * SizeConfig.widthMultiplier,
                  height: 7.90 * SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: ExactAssetImage("assets/images/usr.png"),
                        fit: BoxFit.cover),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
                SizedBox(width: 2.55 * SizeConfig.widthMultiplier),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _isUserLoggedIn ? name.toUpperCase() : "Cardamom",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        _isUserLoggedIn ? mobile.toString() : 'card@gmail.com',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.63 * SizeConfig.heightMultiplier),
            // ListTile(
            //   title: Text(
            //     "Languages",
            //     style: whiteBoldText,
            //   ),
            //   subtitle: Text(
            //     "English US",
            //     style: greyTExt,
            //   ),
            //   trailing: Icon(
            //     Icons.keyboard_arrow_right,
            //     color: Colors.grey.shade400,
            //   ),
            //   onTap: () {},
            // ),
            ListTile(
              title: Text(
                "Profile Settings",
                // style: whiteBoldText,
              ),
              subtitle: Text(
                _isUserLoggedIn ? name : "Cardamom",
                // style: greyTExt,
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                // widget.flag
                //     ? Navigator.of(context).pushNamed(scontactRoute)
                //     : Navigator.of(context).pushNamed(contactRoute);
              },
            ),

            ListTile(
              title: Text(
                "Change Password",
                // style: whiteBoldText,
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                // Navigator.of(context).pushNamed(changePassRoute);
              },
            ),
            ListTile(
              title: Text(
                "Change Profile",
                // style: whiteBoldText,
              ),
              subtitle: Text(
                widget.flag ? "Seller" : "Buyer",
                // style: greyTExt,
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                // Navigator.of(context).pushReplacementNamed(profileRoute);
              },
            ),
            // SwitchListTile(
            //   title: Text(
            //     "Email Notifications",
            //     style: whiteBoldText,
            //   ),
            //   subtitle: Text(
            //     "On",
            //     style: greyTExt,
            //   ),
            //   value: true,
            //   onChanged: (val) {},
            // ),
            // SwitchListTile(
            //   title: Text(
            //     "Push Notifications",
            //     style: whiteBoldText,
            //   ),
            //   subtitle: Text(
            //     "Off",
            //     style: greyTExt,
            //   ),
            //   value: false,
            //   onChanged: (val) {},
            // ),
            SizedBox(height: 2.63 * SizeConfig.heightMultiplier),
            ListTile(
              title: Text(
                "Logout",
                // style: whiteBoldText,
              ),
              trailing: Icon(
                Icons.exit_to_app_rounded,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                // AuthRepo auth = AuthRepo();
                // auth.logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
