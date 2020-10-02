import 'package:flutter/material.dart';
import 'package:sentia_mobile/utils/size_config.dart';

class CustomListTitle extends StatelessWidget{
  
  final IconData icon;  
  final String text;
  final Function onTap;
  final bool selected;
  CustomListTitle(this.icon,this.text,this.selected,this.onTap);

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: EdgeInsets.only(left:0.98*SizeConfig.heightMultiplier,right:0.98*SizeConfig.heightMultiplier),
      child: InkWell(
        hoverColor: Colors.amberAccent,
        splashColor: Colors.amberAccent,
        onTap: onTap,
        child: ListTileTheme(
              selectedColor: Colors.blueGrey,
              child: ListTile(
                selected: selected,
                leading:Icon(icon,color: Colors.white,),
                title:Text(text,style: TextStyle(fontSize: 2.3*SizeConfig.textMultiplier,fontFamily: 'Nunito',color: Colors.white),),
                trailing:Icon(Icons.navigate_next,color: Colors.white), 
              ),
            )
      ),
    );
  }

}