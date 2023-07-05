import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String url = 'http://restapi.adequateshop.com/api/authaccount/login';
  List list = [
    'English',
    'French',
  ];

  /*"Developer5@gmail.com"*/ /*123456*/
  login(BuildContext context) async {
    final dio = Dio();
    Map map = {"email": email.text, "password": password.text};
    var response = await dio.post(url, data: map);
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/home');
      email.clear();
      password.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect Username Or Password')));
    }
    print(response.data);
    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }
}
