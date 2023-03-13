import 'package:flutter/material.dart';

Widget SearchCard(context) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    width: MediaQuery.of(context).size.width * 0.9,
    height: MediaQuery.of(context).size.height * 0.14,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 3,
            spreadRadius: 3,
            offset: Offset(3, 2),
          )
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Yokesh"),
            Text("yokesh.ssmy@gmail.com"),
          ],
        ),
        Container(
          width: 100,
          height: 50,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20.0),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("Message"),
        ),
      ],
    ),
  );
}
