import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tutorial_project/model/UserClass.dart';

class Userinfocall {
  Future<List<UserClass>> fetchListUsers() async {
    final response = await http
        .get(Uri.parse('https://6705ad16031fd46a8310b1f5.mockapi.io/api/users'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Iterable jsonMapResponse = jsonDecode(response.body);
      List<UserClass> userInfoList = List<UserClass>.from(jsonMapResponse.map((model)=> UserClass.fromJson(model)));

      return userInfoList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}