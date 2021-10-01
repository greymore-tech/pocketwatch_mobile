import 'dart:convert';

// import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
// import 'package:pocketwatch_mobile/api/api.dart';
import 'package:pocketwatch_mobile/route/route_generator.dart';
import 'package:pocketwatch_mobile/utils/size_config.dart';
import 'package:pocketwatch_mobile/components/customlisttitle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool selected =false;
  bool _isUserLoggedIn=false;
  String email;
  String  name;
  @override
  void initState() {
   _loadUserData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
       return ListView(
         children: <Widget>[
           Container(
             child: new UserAccountsDrawerHeader(
               decoration: BoxDecoration(
                 gradient: LinearGradient(colors: <Color>[
                   Colors.amber,
                   Colors.yellow
                 ])
               ),
               accountName: Text(_isUserLoggedIn?name:'KnowIT',style: TextStyle(fontFamily: 'Nunito',color:Colors.grey[900] ,fontWeight: FontWeight.bold,fontSize: 2*SizeConfig.textMultiplier),),
               accountEmail:Text(_isUserLoggedIn?email:'knowit@gmail.com',style: TextStyle(fontFamily: 'Nunito',color:Colors.grey[900],fontWeight: FontWeight.bold,fontSize: 2*SizeConfig.textMultiplier)),
               currentAccountPicture: CircleAvatar(
                //  backgroundImage: NetworImage.asset('assets/images/empty_profile.png'),
                 backgroundColor: Colors.blue[300],
                 child:ClipRRect(
                   borderRadius: BorderRadius.circular(45),
                  child: Image.asset("assets/images/other.png",fit:BoxFit.cover )),
                //  Text('K',
                //    style:TextStyle(color:Colors.white,fontFamily: 'Nunito',fontWeight: FontWeight.bold,fontSize:2.3*SizeConfig.textMultiplier )
                //  ),
               ),
             ),
           ),
           Padding(
             padding:EdgeInsets.only(left:0.98*SizeConfig.heightMultiplier,right:0.98*SizeConfig.heightMultiplier),
              child:ListTileTheme(
                selectedColor: Colors.amber[900],
                child: ListTile(
                  selected: true,
                  leading:Icon(Icons.dashboard),
                  title:Text('Dashboard',style: TextStyle(fontSize: 2.3*SizeConfig.textMultiplier,fontFamily: 'Nunito'),),
                ),
              )
           ),
           SizedBox(height:2.06*SizeConfig.heightMultiplier),
          //  InkWell(
          //    splashColor: Colors.amberAccent,
          //    child: ExpandablePanel(
          //      // ignore: deprecated_member_use
          //      hasIcon: false,
          //      header:Padding(
          //        padding: EdgeInsets.only(left:2.90*SizeConfig.heightMultiplier,right:2.98*SizeConfig.heightMultiplier),
          //        child: ListTile(
          //          contentPadding: EdgeInsets.zero,
          //          leading:Icon(Icons.description,color: Colors.white,),
          //          title:Text('Profile',style: TextStyle(fontSize: 2.3*SizeConfig.textMultiplier,fontFamily: 'Nunito',color: Colors.white),),
          //          trailing:Icon(Icons.keyboard_arrow_down,color: Colors.white)
          //        ),
          //      ),
          //      expanded: Column(
          //        children: <Widget>[
          //           CustomListTitle(Icons.perm_identity,'Student Profile',selected,(){
          //            Navigator.of(context).pop();
          //           //  Navigator.of(context).pushNamed(profileRoute);
          //          }),
          //          CustomListTitle(Icons.school,'Educational Details',selected,(){
          //            Navigator.of(context).pop();
          //           //  Navigator.of(context).pushNamed(eduProfileRoute);
          //          }),
          //        ],
          //      ),
          //    ),
          //  ),
           SizedBox(height:2.06*SizeConfig.heightMultiplier),
           CustomListTitle(Icons.library_books,'Courses',selected,(){
             setState(() {
               selected =true;
             });
             Navigator.of(context).pop();
            //  Navigator.of(context).pushNamed(courseMenuRoute);
            
           }),
           SizedBox(height:2.06*SizeConfig.heightMultiplier),
           CustomListTitle(Icons.enhanced_encryption,'Enrolled Courses',selected,(){
             Navigator.of(context).pop();
            //  Navigator.of(context).pushNamed(myCourseMenuRoute);
           }),
           SizedBox(height:2.06*SizeConfig.heightMultiplier),
           CustomListTitle(Icons.date_range,'Exam Schedule',selected,(){
             Navigator.of(context).pop();
            //  Navigator.of(context).pushNamed(examScheduleRoute);
           }),
           SizedBox(height:2.06*SizeConfig.heightMultiplier),
           CustomListTitle(Icons.settings,'Settings',selected,(){
             Navigator.of(context).pop();
            //  Navigator.of(context).pushNamed(settingsRoute);
           }),
          SizedBox(height:2.06*SizeConfig.heightMultiplier),
          CustomListTitle(Icons.contact_mail,'Raise Support Token',selected,(){
             Navigator.of(context).pop();
             Navigator.of(context).pushNamed('/support');
          }),
          SizedBox(height:2.06*SizeConfig.heightMultiplier),
          Container(
            padding:EdgeInsets.only(left:0.98*SizeConfig.heightMultiplier,right:0.98*SizeConfig.heightMultiplier),
            child: Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(25),
              child:GestureDetector(
                onTap: (){
                  logout();
                },
                child: Container(
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(colors: <Color>[
                     Colors.red,
                     Colors.amber
                   ])
                  ),
                  child: ListTileTheme(
                    child:ListTile(
                      leading: Icon(Icons.exit_to_app,color: Colors.white,),
                      title:Text('Logout',style: TextStyle(fontSize: 2.3*SizeConfig.textMultiplier,color: Colors.white,fontWeight: FontWeight.w900,fontFamily: 'Nunito'),),
                    )
                  ),
                ),
              )
            ),
          ),
          SizedBox(height: 2*SizeConfig.heightMultiplier,),
          Container( 
            alignment: Alignment.center,
            padding: EdgeInsets.only(left:0*SizeConfig.heightMultiplier,bottom:1.06*SizeConfig.heightMultiplier ),
            child:InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('/terms');
              },
              child: Text(
              'Terms of Service and Privacy Policy',
              style:TextStyle(
                color: Colors.amber[700],
                fontSize: 1.83*SizeConfig.textMultiplier,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
                // decoration: TextDecoration.underline
              ),
              ),
            )
           
          )
         ]
       );
  
  }

   void logout() async{
     var res;
    // var res = await Api().getData('app/logout');
    if(res.statusCode==200){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('email');
      localStorage.remove('token');
      localStorage.remove('flag');
      Navigator.of(context).pushNamedAndRemoveUntil(indexRoute,(Route<dynamic>route)=>false);
    }
  }
   _loadUserData() async{
    
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if(user != null) {
      setState(() {
        _isUserLoggedIn = true;
        name = user['first_name']+" "+user['last_name'];
        email = user['email'];
      });
    }

  }
}