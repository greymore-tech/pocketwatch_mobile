import 'package:pocketwatch_mobile/utils/size_config.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.redAccent[400];
  final Text title;
  final AppBar appBar;
  final List<Widget> widgets;

  /// you can add more fields that meet your needs

  BaseAppBar({Key key, this.title, this.appBar, this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: title,
      backgroundColor: backgroundColor,
      actions: widgets,
      title: title == null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28 * SizeConfig.widthMultiplier,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.redAccent[400],
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Image.asset('assets/images/logo.png',
                    color: Colors.white,
                    fit: BoxFit.cover,
                        width: 12 * SizeConfig.widthMultiplier,
                        // height: 8.90 * SizeConfig.heightMultiplier,.
                        alignment: FractionalOffset.center),
                  ),
                ),
              ],
            )
          : title,
      elevation: 0.0,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
  // Size get preferredSize => new Size.fromWidth(appBar.preferredSize.width);
}
