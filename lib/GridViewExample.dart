import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorial_project/data/InfoKeys.dart';

import 'model/UserClass.dart';
/*late List<UserClass>listInfoValueGlobal;
var providerMeals = Provider((ref){
  return listInfoValueGlobal;
});*/
class GridList extends StatelessWidget{
  GridList({super.key,required this.listInfoValue});
  final List<UserClass>listInfoValue;
  @override
  Widget build(BuildContext context) {
    // listInfoValueGlobal = listInfoValue;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop({
            Infokeys.gridListItems : listInfoValue.first
          });
          return false;
        },
        child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),children: [
          for(final item in listInfoValue)
            Text(item.name??"")
        
        ],),
      ),
    );
  }

  
}