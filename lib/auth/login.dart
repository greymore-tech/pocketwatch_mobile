import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pocketwatch_mobile/utils/size_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart'; 

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var email;
  var password;
  bool _tapped=false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  bool _isLoading = false;
  
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: true,    
      body:SafeArea(
            child:Stack( 
               fit:StackFit.expand,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        flex:_tapped?5:3,
                        child: Align(
                          alignment: Alignment.topCenter,
                           child: KnowItIconWidget(),
                        ),
                      ),

                      Expanded(
                        flex:_tapped?5:7,
                        child: Align(
                          alignment: Alignment(0.0,0.7),
                          child: Container(
                            padding:EdgeInsets.only(left:1.22*SizeConfig.heightMultiplier,right:1.22*SizeConfig.heightMultiplier),
                            height: 42.89*SizeConfig.heightMultiplier,
                            child: Material(
                              // elevation:3,
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.transparent,
                              child: Form(
                                key: _formKey,
                                child: formFieldWidget()
                              ),
                            ),
                          ),
                         
                        ),
                      )
                    ],
                  )
                ],
            )
        
        
      )
    );
  }
  Container formFieldWidget () {
      return Container(
        padding: EdgeInsets.only(top: 1.83*SizeConfig.heightMultiplier,left: 2.20*SizeConfig.heightMultiplier,right: 2.20*SizeConfig.heightMultiplier),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  _tapped = true;
                });
              },
              child: Column(
                  children: <Widget>[
                      Container(
                        height: 9.80*SizeConfig.heightMultiplier,
                        child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: emailController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800]
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:Colors.amber)
                                  )
                              ),
                          validator: (emailValue){
                            if(emailValue.isEmpty){
                              return 'Please enter email';
                            }
                            email = emailValue;
                            return null;
                          },
                        ),
                      ),
                          SizedBox(height: 1.22*SizeConfig.heightMultiplier),
                          Container(
                            height: 9.80*SizeConfig.heightMultiplier,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800]
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:Colors.amber)
                                  )
                              ),
                              obscureText: true,
                              validator: (passwordValue){
                            if(passwordValue.isEmpty && passwordValue.length < 8){
                              return 'Please specify password of 8 characters';
                            }
                            password = passwordValue;
                            return null;
                        },
                        ),
                          ),
                          SizedBox(height: 1.83*SizeConfig.heightMultiplier,),
                          GestureDetector(
                            onTap: () {
                               setState(() {
                                  _tapped=false;
                                });
                              if(_formKey.currentState.validate()){
                                _login();
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
                                height:8.57*SizeConfig.heightMultiplier,
                                child: Center(
                                    child: Text(
                                      _isLoading? 'Processing..' :
                                      'LOGIN',
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
                          SizedBox(height:0.34*SizeConfig.heightMultiplier,),
                          Container(
                            padding: EdgeInsets.only(top: 1.71*SizeConfig.heightMultiplier),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                   text:'New User? ',
                                   style:TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 1.6*SizeConfig.textMultiplier,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito',
                                    ), 
                                  children: <TextSpan>[
                                      TextSpan(
                                        text:'Sign Up',
                                        style:TextStyle(
                                          color: Colors.blue,
                                          fontSize: 1.6*SizeConfig.textMultiplier,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Nunito',
                                          // decoration: TextDecoration.underline
                                        ),
                                        recognizer: TapGestureRecognizer()
                                        ..onTap=(){
                                          // Navigator.of(context).pushNamed(signUpRoute);
                                        }
                                      ),
                                      TextSpan(
                                      text: '                 ForgotPassword?',
                                      style:TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 1.6*SizeConfig.textMultiplier,
                                      fontFamily: 'Nunito',
                                      //  decoration: TextDecoration.underline
                                      ),
                                      recognizer: TapGestureRecognizer()
                                      ..onTap=()async{
                                          const url = "https://''/password/reset";
                                          if(await canLaunch(url)){
                                            await launch(url);
                                          }
                                          else{
                                            Fluttertoast.showToast(msg:"Failed to reset password , Please check your Internet Connection");
                                          }
                                      },
                                    )
                                  ]
                                ),
                              ),
                            ),
                          ),    
                  ],
              ),
            ),
      );
    
  }
  void _login() async{
  //   setState(() {
  //     _tapped = false;
  //     _isLoading = true;
  //   });
  //   var data = {
  //     'email' : email,
  //     'password' : password
  //   };

  //   var res = await Api().postData(data, 'app/login');
  //   if(res.statusCode==200){
  //     Map<String,dynamic>responseJson = json.decode(res.body);
  //     // print(responseJson['user']['type']);
  //     if(responseJson['user']['type']=="student"){
  //       var body = json.decode(res.body);
  //       SharedPreferences localStorage = await SharedPreferences.getInstance();
  //       localStorage.setString('email',body['user']['email']);
  //       localStorage.setString('token', json.encode(body['token']));
  //       localStorage.setString('user', json.encode(body['user']));
  //       Navigator.of(context).pushReplacementNamed('checkauth');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //     else{
  //       // Navigator.of(context).pushReplacement(
  //       //   MaterialPageRoute(
  //       //     builder: (BuildContext context) => Universe())
  //       // );
  //     }
  //   }
  //   else{
  //     var body = json.decode(res.body);
  //     _showMsg(body['message']);
  //      setState(() {
  //     _isLoading = false;
  //   });
  //   }
  }
}
  class KnowItIconWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return FittedBox(
                child:  Container( 
                 width: 150.20*SizeConfig.widthMultiplier,
                 constraints: BoxConstraints(
                   minHeight: 36.90*SizeConfig.heightMultiplier,
                   maxHeight: 62.31*SizeConfig.heightMultiplier
                 ),
                 margin: EdgeInsets.only(top:100.5),
                 decoration: new BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   image: new DecorationImage(
                     image: ExactAssetImage('assets/images/logo.png'),
                     fit: BoxFit.cover
                   )
                 ),
               )
      );
    }
  }
  