import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_project/data/InfoKeys.dart';
import 'package:tutorial_project/data/UserInfoCall.dart';
import 'package:tutorial_project/model/UserClass.dart';

class ExpensesList extends StatelessWidget {
   final List<UserClass> listData;
   ExpensesList({super.key,
     required this.listData
     ,required this.onSelectFunction});
   final void Function() onSelectFunction;

@override
  Widget build(BuildContext context) {
  /*categories.entries.map((element){

  });*/
    return ListView.builder(itemCount: listData.length,itemBuilder:(context,index)=>
      GestureDetector(
        onTap:(){
          onSelectFunction();
        },
        child: Container(margin: EdgeInsets.only(left: 10,right: 10),child: Text(style: TextStyle(
          fontSize: 24,
          color: Colors.blue, // Change text color here
        ) ,listData[index].name??"test")),
      )
    );
  }

}
var categories = {
  Infokeys.gridDetailsInfo : UserClass(name: "",avatar: "",createdAt: "",id: "")
};