import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  void successFlushbar(BuildContext context, String msg) {
    Flushbar(
      backgroundColor: Colors.green[300],
      flushbarPosition: FlushbarPosition.TOP,
      title: "Success",
      message: msg,
      icon: Icon(
        Icons.done,
        size: 28,
        color: Colors.green[900],
      ),
      leftBarIndicatorColor: Colors.green[300],
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void warningFlushbar(BuildContext context, String msg) {
    Flushbar(
      backgroundColor: Colors.orange[400],
      flushbarPosition: FlushbarPosition.TOP,
      title: "Warning",
      message: msg,
      icon: Icon(
        Icons.warning,
        size: 28,
        color: Colors.amberAccent[900],
      ),
      leftBarIndicatorColor: Colors.orange[400],
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void warningFlushbar2(BuildContext context, String msg) {
    Flushbar(
      backgroundColor: Colors.orange[900],
      flushbarPosition: FlushbarPosition.TOP,
      title: "Warning",
      message: msg,
      icon: Icon(
        Icons.warning,
        size: 28,
        color: Colors.orange[200],
      ),
      leftBarIndicatorColor: Colors.orange[900],
      duration: Duration(seconds: 5),
    )..show(context);
  }

  void failedFlushbar(BuildContext context, String msg) {
    Flushbar(
      backgroundColor: Colors.red[400],
      flushbarPosition: FlushbarPosition.TOP,
      title: "Failed",
      message: msg,
      icon: Icon(
        Icons.error,
        size: 28,
        color: Colors.redAccent[700],
      ),
      leftBarIndicatorColor: Colors.red[400],
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void successFlushbarE(BuildContext context, String msg) {
    Flushbar(
      messageSize: 20.0,
      backgroundColor: Colors.green[300],
      flushbarPosition: FlushbarPosition.TOP,
      title: "Success",
      message: msg,
      icon: Icon(
        Icons.done,
        size: 28,
        color: Colors.green[900],
      ),
      leftBarIndicatorColor: Colors.green[300],
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void warningFlushbarE1(BuildContext context, String msg) {
    Flushbar(
      messageSize: 20.0,
      backgroundColor: Colors.orange[400],
      flushbarPosition: FlushbarPosition.TOP,
      title: "Warning",
      message: msg,
      icon: Icon(
        Icons.warning,
        size: 28,
        color: Colors.amberAccent[900],
      ),
      leftBarIndicatorColor: Colors.orange[400],
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void warningFlushbarE2(BuildContext context, String msg) {
    Flushbar(
      messageSize: 20.0,
      backgroundColor: Colors.orange[900],
      flushbarPosition: FlushbarPosition.TOP,
      title: "Warning",
      message: msg,
      icon: Icon(
        Icons.warning,
        size: 28,
        color: Colors.orange[200],
      ),
      leftBarIndicatorColor: Colors.orange[900],
      duration: Duration(seconds: 5),
    )..show(context);
  }
}
