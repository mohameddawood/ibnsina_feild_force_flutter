import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

void moveTo(BuildContext context, Widget rout) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => rout),
  );
}

void moveToWithStack(BuildContext context, Widget rout) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return rout;
    }),
  );
}

void moveToWithReplace(BuildContext context, Widget rout) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => rout,
    ),
  );
}

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

showProgressDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: CircularProgressIndicator());
      });
}

Future<void> showMyDialog(
    BuildContext context, String alertTitle, String message) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Lottie.asset('assets/images/error.json',
                  width: 150, height: 150, repeat: false),
              Center(child: Text(message)),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

String isInputTextNotValid(String value, String message) {
  if (value == null || value.isEmpty) {
    return message;
  }
  return null;
}

Widget showProgressLoading(){
  return SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
    },
  );
}
