import 'package:cad_mobile/repositories/settings_repo.dart';
import 'package:flutter/material.dart';
import 'package:cad_mobile/utils/size_config.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  // var showBanner = true;
  @override
  void initState() {
    super.initState();
    // userVerified();
  }

  // final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  // userVerified() async {
  //   var res = await Api().getData('user');
  //   if (res.statusCode == 200) {
  //     var body = json.decode(res.body);
  //     // print(body);
  //     if (body['email_verified_at'] != null) {
  //       setState(() {
  //         showBanner = false;
  //       });
  //     } else {
  //       setState(() {
  //         showBanner = true;
  //       });
  //     }
  //   }
  //   // SharedPreferences preferences;
  //   // preferences = await SharedPreferences.getInstance();
  //   // var v = preferences.getString("flag");
  //   // if(v=='yes'){
  //   //   setState(() {
  //   //     showBanner=false;
  //   //   });
  //   // }else{
  //   //   setState(() {
  //   //     showBanner=true;
  //   //   });
  //   // }
  // }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  TextEditingController currentPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmNewPasswordController = TextEditingController();

  var flagUnlock = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF006838),
        
        title:Container(
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Image.asset('assets/images/logo.png',
                        width: 9 * SizeConfig.widthMultiplier,
                        height: 5.90 * SizeConfig.heightMultiplier,
                        alignment: FractionalOffset.center),
                  ),
                ),
                centerTitle: true,
      ),
      
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      // resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height:20),
            Container(
              padding: EdgeInsets.only(
                  top: 1.22 * SizeConfig.heightMultiplier,
                  left: 1.22 * SizeConfig.heightMultiplier,
                  right: 1.22 * SizeConfig.heightMultiplier),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]))),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 2.20 * SizeConfig.heightMultiplier,
                          top: 1.83 * SizeConfig.heightMultiplier,
                          right: 1.83 * SizeConfig.heightMultiplier),
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                            bottom: 1.22 * SizeConfig.heightMultiplier),
                        child: Text(
                          'Change Password',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 2.8 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.w300,
                              color: Colors.blueGrey[900]),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 27.77 * SizeConfig.widthMultiplier,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.grey[700],
                      onPressed: () {
                        setState(() {
                          flagUnlock == true
                              ? flagUnlock = false
                              : flagUnlock = true;
                        });
                      },
                      child: Text(
                        flagUnlock ? 'Unlocked' : 'Unlock',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 1.8 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height:10),
            Padding(
              padding: EdgeInsets.only(
                  left: 2 * SizeConfig.heightMultiplier,
                  right: 2 * SizeConfig.heightMultiplier,
                  top: 2.40 * SizeConfig.heightMultiplier,
                  bottom: 1.83 * SizeConfig.heightMultiplier),
              child: TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter your current password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  enabled: flagUnlock,
                  controller: currentPasswordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.blueGrey),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: "Current Password",
                      labelStyle: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700]),
                      hintText: "Current Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)))),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 2 * SizeConfig.heightMultiplier,
                  right: 2 * SizeConfig.heightMultiplier,
                  top: 2.40 * SizeConfig.heightMultiplier,
                  bottom: 1.83 * SizeConfig.heightMultiplier),
              child: TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter your new password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  enabled: flagUnlock,
                  controller: newPasswordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.update, color: Colors.blueGrey),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: "New Password",
                      labelStyle: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700]),
                      hintText: "Enter new Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)))),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 2 * SizeConfig.heightMultiplier,
                  right: 2 * SizeConfig.heightMultiplier,
                  top: 1.22 * SizeConfig.heightMultiplier,
                  bottom: 2.83 * SizeConfig.heightMultiplier),
              child: TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter your  password again';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  enabled: flagUnlock,
                  controller: confirmNewPasswordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.update, color: Colors.blueGrey),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: "Confirm New Password",
                      labelStyle: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700]),
                      hintText: "Confirm new Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)))),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: 0.98 * SizeConfig.heightMultiplier,
                  bottom: 1.22 * SizeConfig.heightMultiplier),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 5.74 * SizeConfig.heightMultiplier,
                  width: 27.77 * SizeConfig.widthMultiplier,
                  child: GestureDetector(
                      onTap: () {
                        if (newPasswordController.text ==
                            confirmNewPasswordController.text) {
                          SettingsRepo sett = SettingsRepo();
                          sett.change(
                              context,
                              currentPasswordController.text,
                              newPasswordController.text,
                              confirmNewPasswordController.text);
                          setState(() {
                            flagUnlock = false;
                          });
                        } else {
                          _showMsg(' New Password miss match');
                        }
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        color: flagUnlock ? Colors.blue[700] : Colors.grey[800],
                        child: Center(
                          child: Text(
                            'Change',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w800,
                              fontSize: 2 * SizeConfig.textMultiplier,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
