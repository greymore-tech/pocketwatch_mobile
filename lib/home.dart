import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocketwatch_mobile/components/drawer.dart';
import 'package:pocketwatch_mobile/utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  var flag=false;
  var totalCourses = 0;
  var attendingCourses = 0;
  var completedCourses= 0;
  var examRegistered = 0;
  @override
  void initState() {
    getCounts();
    getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        title: InkWell(
          onTap: (){
            // Navigator.of(context).pushNamed('/home');
          },
          child: new Image.asset('assets/images/logo.png' ,width: 11.57*SizeConfig.widthMultiplier,height:5.90*SizeConfig.heightMultiplier ,alignment: FractionalOffset.center)),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 0.61*SizeConfig.heightMultiplier,top:0.61*SizeConfig.heightMultiplier,bottom:0.61*SizeConfig.heightMultiplier),
            child: GestureDetector(
              onTap: (){
                // Navigator.of(context).pushNamed(profileRoute);
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, //remove this when you add image.
                ),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: Image.asset("assets/images/other.png",fit:BoxFit.cover ))
              ),
            ),
          )
        ],
      ),
      
      drawer:Theme(
        
        data: Theme.of(context).copyWith(
                 canvasColor: Color.fromRGBO(47, 79, 79,0.9), 
        ),
        child: Drawer(
          child:CustomDrawer()
        ),
      ),
      body: SafeArea(
        child:Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(top:1.10*SizeConfig.heightMultiplier,bottom:1*SizeConfig.heightMultiplier,left:3.45*SizeConfig.heightMultiplier,right:1.22*SizeConfig.heightMultiplier),
                child:Row(
                  children: <Widget>[
                    Icon(Icons.dashboard,color: Colors.blueGrey,size: 10*SizeConfig.imageSizeMultiplier,),
                    SizedBox(width:15),
                    Text("Dashboard",style: TextStyle(
                      color: Colors.blueGrey[600],
                      fontSize: 4.5*SizeConfig.textMultiplier,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Nunito',
                    ),),
                  ],
                )
              ),
            ),
            Container(
              height: 24*SizeConfig.heightMultiplier,
              // color:Colors.blue,
              padding: EdgeInsets.only(left:3.67*SizeConfig.heightMultiplier,right:3.67*SizeConfig.heightMultiplier),
              child:Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).pushNamed(myCourseMenuRoute);
                          },
                          child: _buildCard("Total Courses", totalCourses),
                        ),
                      ),
                      SizedBox(width:3.47*SizeConfig.widthMultiplier),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).pushNamed(myCourseMenuRoute);
                          },
                          child: _buildCard("Attending Courses", attendingCourses),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height:1.22*SizeConfig.heightMultiplier),
                   Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).pushNamed(myCourseMenuRoute);
                          },
                          child: _buildCard("Exams Registered", completedCourses),
                        ),
                      ),
                      SizedBox(width:3.47*SizeConfig.widthMultiplier),
                      Expanded(
                        child: _buildCard("Completed Courses", examRegistered),
                      )
                    ],
                  ),
                ],
              )
            ),
          Padding(
            padding: EdgeInsets.only(left:3.06*SizeConfig.heightMultiplier,right:3.06*SizeConfig.heightMultiplier),
            child: Divider(thickness: 1),
          ),
          SizedBox(height:1*SizeConfig.heightMultiplier),
          Container(
                padding: EdgeInsets.only(top:0.10*SizeConfig.heightMultiplier,bottom:1*SizeConfig.heightMultiplier,left:3.45*SizeConfig.heightMultiplier,right:1.22*SizeConfig.heightMultiplier),
                child:Row(
                  children: <Widget>[
                    Icon(Icons.link,color: Colors.blueGrey,size: 6*SizeConfig.imageSizeMultiplier,),
                    SizedBox(width:15),
                    Text("Quick Links",style: TextStyle(
                      color: Colors.blueGrey[600],
                      fontSize: 1.8*SizeConfig.textMultiplier,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Nunito',
                    ),),
                  ],
                )
              ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left:3.06*SizeConfig.heightMultiplier,right:3.06*SizeConfig.heightMultiplier),
              child: Container(               
                child:FutureBuilder(
                  future:getCategories(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child:CircularProgressIndicator()
                      );
                    }
                    else{
                      if (snapshot.hasData) {
                        if(snapshot.data.length>6){
                          setState(() {
                            flag = true;
                          });
                        }
                        // print(snapshot.data.length);
                        if(snapshot.data.length==0){
                        return SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topCenter,
                                padding: EdgeInsets.only(top: 3.20*SizeConfig.heightMultiplier, bottom: 1*SizeConfig.heightMultiplier),
                                child: Text(
                                  'No Categories Available',
                                  style: TextStyle(
                                      fontSize: 2.94*SizeConfig.textMultiplier,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[900]),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 40.01*SizeConfig.heightMultiplier,
                                // child: Center(child:SvgPicture.asset("assets/images/soon.svg"))
                              ),
                            ],
                          ),
                        );
                        }
                        return ListView.builder(
                            // primary: false,
                            physics: flag?AlwaysScrollableScrollPhysics():NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:EdgeInsets.all(0.73*SizeConfig.heightMultiplier),
                                child: _buildCategory(snapshot.data.length,snapshot.data[index].category),
                              );
                            }
                        );
                      }
                      else if(!snapshot.hasData){
                        return Center(child: Text("No Categories Available"));
                      }
                      else if(snapshot.hasError){
                        return Center(child: Text("Failed to load Categories"),);
                      }
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )
              ),
            ),
          ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                // padding: EdgeInsets.only(left:1.22*SizeConfig.heightMultiplier,right:1.22*SizeConfig.heightMultiplier),
                height: 3*SizeConfig.heightMultiplier,
                color: Colors.grey[100],
                child:RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:' © 2020 KnowIt Education India.    Powered by ',
                    style:TextStyle(
                      color: Colors.grey[600],
                      fontSize: 1.5*SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                    ), 
                    children: <TextSpan>[
                      TextSpan(
                        text:' Greymore Tech',
                        style:TextStyle(
                          color: Colors.amber[800],
                          fontSize: 1.6*SizeConfig.textMultiplier,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                        recognizer: TapGestureRecognizer()
                        ..onTap=() async{
                            const url = "https://greymore.tech";
                            if(await canLaunch(url)){
                              await launch(url);
                            }
                            else{
                              Fluttertoast.showToast(msg:"Failed to launch Url , Please check your Internet Connection");
                            }
                        }
                      )
                    ]
                  ),
                )
              ),
            ), 
          ],
        )
      ),
    );
  }
  Widget _buildCategory(int count,String category) {
    return GestureDetector(
            onTap:(){
              // Navigator.of(context).pushNamed(sortedMenuRoute,arguments: category);
            },
            child:Container(
              height: 6.12*SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(220,20,60,1.0),
              ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 2*SizeConfig.textMultiplier,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
    );
  }
  Widget _buildCard(String text,int count){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Colors.red,
          Colors.amber,
        ]),
        borderRadius: BorderRadius.circular(10),
      ),
      child:Material(
        borderRadius: BorderRadius.circular(10),
        color:Colors.transparent,
        child: ListTile(
          title:Text(text,textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize:1.8*SizeConfig.textMultiplier,fontWeight:FontWeight.w800)),
          subtitle: Padding(
            padding: EdgeInsets.only(top:0.30*SizeConfig.heightMultiplier),
            child: Text(count.toString(),textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize:1.6*SizeConfig.textMultiplier,fontWeight:FontWeight.w800)),
          ),
        ),
      ),
    );
  }
  
  Future<void> getCategories() async {
  //   var cat = List<Categories>();
  //   var res = await Api().fetchData('getCategories');
  //   if(res.statusCode==200){
  //     var categories = json.decode(res.body);
  //     for(categories in categories){
  //       cat.add(Categories.fromJson(categories));
  //     }
  //   }else{
  //     Fluttertoast.showToast(msg:"Failed to Load Categories, Check Network connection");
  //     }
  //   return cat;
    
  }
  void getCounts() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var user = jsonDecode(localStorage.getString('user'));

    // var data = {
    //   'user_id': user['id'],
    // };
    // var res = await Api().fetchParamData(data, 'getStudentCounts');
    // // print(res.body);
    // if(res.statusCode == 200){
    //   var body = json.decode(res.body);
    //   if(mounted){
    //     setState(() {
    //       totalCourses = body["courses"];
    //       attendingCourses =body["current"];
    //       completedCourses = body["completed"];
    //       examRegistered = body["exams"];
    //     });
    //   }
    // }
  }

}

