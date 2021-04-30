import 'package:flutter/cupertino.dart';

Widget getPaddingTop({num val = 10.0}) =>
    Padding(padding: EdgeInsets.only(top: val));

Widget getPaddingBottom({num val = 10.0}) =>
    Padding(padding: EdgeInsets.only(bottom: val));

Widget getPaddingStart({num val = 10.0}) =>
    Padding(padding: EdgeInsets.only(right: val));

Widget getPaddingEnd({num val = 10.0}) =>
    Padding(padding: EdgeInsets.only(left: val));

Widget getPadding({num val = 10.0}) => Padding(padding: EdgeInsets.all(val));