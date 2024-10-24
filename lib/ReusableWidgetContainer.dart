import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_project/res/ColorResource.dart';

class Reusablewidgetcontainer extends StatelessWidget {
  Reusablewidgetcontainer({required this.containerColor});
  Color containerColor;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(color: (containerColor),borderRadius: BorderRadius.circular(10.0)),
      ///MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}