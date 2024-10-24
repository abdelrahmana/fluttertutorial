import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_project/res/ColorResource.dart';

class Iconcontent extends StatelessWidget {
  Iconcontent({required this.containerColor,this.imageUrl});
  final Color containerColor;
  final String? imageUrl;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(imageUrl!=null)
        Image(image: NetworkImage(imageUrl!))
        else
          Image(image: AssetImage(imageUrl!))
        ,
      ],
    );
  }
}