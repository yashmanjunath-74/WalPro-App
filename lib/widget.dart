import 'package:flutter/material.dart';

Widget brandname() {
  return Row(
    children: <Widget>[
      SizedBox(width: 20),
      Text(
        "Wal",
        style: TextStyle(color: Colors.white),
      ),
      Text("Pro", style: TextStyle(color: Colors.lightBlueAccent))
    ],
  );
}
