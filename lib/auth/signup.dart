import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocketwatch_mobile/utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var checkBoxValue = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: true,
      appBar: new AppBar(
        title: InkWell(
          onTap: (){
            Navigator.of(context).pushNamedAndRemoveUntil('/home',(Route<dynamic>route)=>false);
          },
          child: new Image.asset('assets/images/logo.png' ,width: 11.57*SizeConfig.widthMultiplier,height:5.90*SizeConfig.heightMultiplier ,alignment: FractionalOffset.center)),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          child: Icon(Icons.arrow_back, color: Colors.black),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 2.40*SizeConfig.heightMultiplier, bottom: 2*SizeConfig.heightMultiplier),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 2.94*SizeConfig.heightMultiplier,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[900]),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left:1.22*SizeConfig.heightMultiplier,right:1.22*SizeConfig.heightMultiplier),
                    child: Material(
                      color:Colors.transparent,
                      borderRadius: BorderRadius.circular(24.0),
                      // elevation: 3.0,
                      child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 1.83*SizeConfig.heightMultiplier, top: 1.5*SizeConfig.heightMultiplier, right: 1.83*SizeConfig.heightMultiplier, bottom: 1*SizeConfig.heightMultiplier),
                        child: Container(
                          height: 9.804*SizeConfig.heightMultiplier,
                          child: TextFormField(
                              validator: (firstname) {
                                if (firstname.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              controller: firstNameController,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.person, color: Colors.blueGrey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:BorderSide(color: Colors.grey[300]),
                                    borderRadius: BorderRadius.circular(10)),
                                  labelText: "First Name",
                                  labelStyle: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[850]),
                                  hintText: "First Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey[300])))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 1.83*SizeConfig.heightMultiplier, top: 1*SizeConfig.heightMultiplier, right: 1.83*SizeConfig.heightMultiplier, bottom: 1*SizeConfig.heightMultiplier),
                        child: Container(
                          height: 9.80*SizeConfig.heightMultiplier,
                          child: TextFormField(
                              validator: (lastname) {
                                if (lastname.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              controller: lastNameController,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.person, color: Colors.blueGrey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:BorderSide(color: Colors.grey[300]),
                                    borderRadius: BorderRadius.circular(10)),
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[850]),
                                  hintText: "Last Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey[300])))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 1.83*SizeConfig.heightMultiplier, top: 1*SizeConfig.heightMultiplier, right: 1.83*SizeConfig.heightMultiplier, bottom: 1*SizeConfig.heightMultiplier),
                        child: Container(
                            height: 9.80*SizeConfig.heightMultiplier,
                            child: TextFormField(
                                validator: (emailValue) {
                                  if (emailValue.isEmpty) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration: InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.email, color: Colors.blueGrey),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:BorderSide(color: Colors.grey[300]),
                                      borderRadius:
                                            BorderRadius.circular(10)),
                                    labelText: "Email",
                                    labelStyle: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[850]),
                                    hintText: "Email Address",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.grey[300]))))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 1.83*SizeConfig.heightMultiplier, top: 1*SizeConfig.heightMultiplier, right: 1.83*SizeConfig.heightMultiplier, bottom: 1*SizeConfig.heightMultiplier),
                        child: Container(
                            height: 9.80*SizeConfig.heightMultiplier,
                            child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter phone number';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                                controller: phoneController,
                                decoration: InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.phone, color: Colors.blueGrey),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:BorderSide(color: Colors.grey[300]),
                                      borderRadius:
                                            BorderRadius.circular(10)),
                                    labelText: "Phone Number",
                                    labelStyle: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[850]),
                                    hintText: "Phone Number",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.grey[300]))))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 1.83*SizeConfig.heightMultiplier, top: 1*SizeConfig.heightMultiplier, right: 1.83*SizeConfig.heightMultiplier, bottom: 1*SizeConfig.heightMultiplier),
                        child: Container(
                          height: 9.80*SizeConfig.heightMultiplier,
                          child: TextFormField(
                              validator: (passwordValue) {
                                if (passwordValue.isEmpty &&
                                    passwordValue.length < 8) {
                                  return 'Please enter password of 8 characters';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_outline,
                                      color: Colors.blueGrey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:BorderSide(color: Colors.grey[300]),
                                    borderRadius: BorderRadius.circular(10)),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[850]),
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:BorderSide(color: Colors.grey[300])))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 1.83*SizeConfig.heightMultiplier, top: 1*SizeConfig.heightMultiplier, right: 1.83*SizeConfig.heightMultiplier, bottom: 1.3*SizeConfig.heightMultiplier),
                        child: Container(
                          child: TextFormField(
                              validator: (confirmPasswordValue) {
                                if (confirmPasswordValue.isEmpty &&
                                    confirmPasswordValue.length < 8) {
                                  return 'Please enter password of 8 characters';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              controller: confirmPasswordController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_outline,
                                      color: Colors.blueGrey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:BorderSide(color: Colors.grey[300]),
                                    borderRadius: BorderRadius.circular(10)),
                                  labelText: "Confirm Password",
                                  labelStyle: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[850]),
                                  hintText: "Confirm Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey[300])))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 0*SizeConfig.heightMultiplier, top: 1*SizeConfig.heightMultiplier, right: 1.83*SizeConfig.heightMultiplier, bottom: 1.67*SizeConfig.heightMultiplier),
                        child: Row(
                          children: <Widget>[
                            Checkbox(value: checkBoxValue,
                              activeColor: Colors.amber,
                              onChanged:(bool newValue){
                                setState(() {
                                  checkBoxValue = newValue;
                                });
                              
                              }),
                               RichText(
                                     text: TextSpan(
                                       text:'I agree to the ',
                                       style:TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 1.83*SizeConfig.textMultiplier,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Nunito',
                                        ), 
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:'Terms of Service ',
                                            style:TextStyle(
                                              color: Colors.amber[700],
                                              fontSize: 1.83*SizeConfig.textMultiplier,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito',
                                              // decoration: TextDecoration.underline
                                            ),
                                            recognizer: TapGestureRecognizer()
                                            ..onTap=(){
                                              Navigator.of(context).pushNamed('/terms');
                                            }
                                          ),
                                           TextSpan(
                                            text:'and',
                                            style:TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 1.83*SizeConfig.textMultiplier,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito',
                                              
                                            ),
                                            
                                          ),
                                           TextSpan(
                                            text:' Privacy Policy',
                                            style:TextStyle(
                                              color: Colors.amber[700],
                                              fontSize: 1.83*SizeConfig.textMultiplier,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito',
                                              // decoration: TextDecoration.underline
                                            ),
                                            recognizer: TapGestureRecognizer()
                                            ..onTap=(){
                                              Navigator.of(context).pushNamed('/terms');
                                            }
                                          )
                                        ]
                                     ),
                                   ),
                          ],
                        ),
                      )
                    ])),
                  ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 1.83*SizeConfig.heightMultiplier, top: 1*SizeConfig.heightMultiplier, right: 1.83*SizeConfig.heightMultiplier, bottom: 1.83*SizeConfig.heightMultiplier),
                      child: GestureDetector(
                        onTap: () {
                            if(checkBoxValue){
                              if (_formKey.currentState.validate()) {
                                _handleSignUp();
                              }
                              
                            }else{
                                Fluttertoast.showToast(msg: " Agree to the Terms of Service and Privacy Policy ",
                                  backgroundColor: Colors.grey[500],
                                );
                              }
                          },
                        child: Material(
                          borderRadius: BorderRadius.circular(29.4),
                          shadowColor: Colors.amberAccent[700],
                          color:Colors.transparent,
                          elevation: 7.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29.4),
                              gradient: LinearGradient(colors: <Color>[
                                Colors.red,
                                Colors.amber
                              ])
                            ),
                            height: 6.74*SizeConfig.heightMultiplier,
                            width: 69.64*SizeConfig.widthMultiplier,
                            child: Center(
                                child: Text(
                                  _isLoading ? 'Creating..' : 'SIGN UP',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 2.08*SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ),
                        ),
                      ),
                    ),
                  
                ]),
          ),
        ),
      ),
    );
  }

  void _handleSignUp() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   var data = {
  //     'first_name': firstNameController.text,
  //     'last_name': lastNameController.text,
  //     'email': emailController.text,
  //     'password': passwordController.text,
  //     'password_confirmation': confirmPasswordController.text,
  //     'phone':int.parse(phoneController.text)
  //   };
  //   if (confirmPasswordController.text == passwordController.text) {
  //     final res = await Api().postData(data, 'app/register');

  //     // print(res);
  //     var body = json.decode(res.body);
  //     // print(body);
  //     if (res.statusCode == 200) {
  //       SharedPreferences localStorage = await SharedPreferences.getInstance();
  //       localStorage.setString('email',body['user']['email']);
  //       localStorage.setString('token', json.encode(body['token']));
  //       localStorage.setString('user', json.encode(body['user']));
  //       Navigator.of(context).pushReplacementNamed('checkauth');
  //     } else {
  //       _showMsg(body['message'].toString());
  //     }

  //     setState(() {
  //       _isLoading = false;
  //     });
  //   } else {
  //     _showMsg('Password Mismatch..');
  //     print('Password Missmatch');
  //   }
  }
}
