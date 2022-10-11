import 'package:pocketwatch_mobile/models/current_user.dart';
import 'package:flutter/material.dart';
import 'package:pocketwatch_mobile/view/home.dart';

import 'index.dart';

enum AuthStatus { notLoggedIn, loggedIn }

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;
  CurrentUser _currentUser = CurrentUser();
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    String _returnString = await _currentUser.onStartup();
    if (_returnString == "success") {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        retVal = Index();
        break;
      case AuthStatus.loggedIn:
        retVal = Home();

        break;
      default:Index();
    }
    return retVal;
  }
}
