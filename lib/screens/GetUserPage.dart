import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../UserViewModel.dart';
class Getuserpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<UserViewModel>().fetchUser();
    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: Center(
        child: Consumer<UserViewModel>(
          builder: (context, userViewModel, child) {
            if (userViewModel.user == null) {
              return CircularProgressIndicator();
            } else {
              return (ListView.builder(itemCount : userViewModel.user?.length,itemBuilder: (context,index)=>
                  Text(userViewModel.user?[index].name??"")
              )

              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<UserViewModel>().fetchUser(),
        child: Icon(Icons.download),
      ),
    );
  }
}
