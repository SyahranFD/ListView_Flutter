import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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

Widget ratingBar (double rating) {
  return RatingBar.builder(
    initialRating: rating,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
    itemSize: 20,
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: (rating) {
      print(rating);
    },
  );
}