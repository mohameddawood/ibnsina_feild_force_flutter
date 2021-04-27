import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void moveTo(BuildContext context, Widget rout) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => rout),
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

void showMessage(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
showProgressDialog(BuildContext context){
  showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(child: CircularProgressIndicator());
          });
}
Future<void> showMyDialog(BuildContext context,String alertTitle,String message) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(alertTitle),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
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
