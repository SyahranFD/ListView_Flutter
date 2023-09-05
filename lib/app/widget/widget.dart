import 'package:flutter/material.dart';

Widget textMaxLines({
  required String textValue,
  required TextStyle textStyle,
  required int maxLines
}) {
  return Container(
    child: Text(
      textValue,
      style: textStyle,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget textMarginLeftRight({
  required String textValue,
  required TextStyle textStyle,
  required double marginLeft,
  required double marginRight

}) {
  return Container(
    margin: EdgeInsets.only(left: marginLeft, right: marginRight),
    child: Text(
      textValue,
      style: textStyle,
    ),
  );
}

Widget textFormFieldLogin({required String label, required bool isObsecure}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    child: TextFormField(
      obscureText: isObsecure,
      style: TextStyle(color: Colors.white),

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),

        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
      ),
    ),
  );
}