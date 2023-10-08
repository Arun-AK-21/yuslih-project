import 'package:flutter/material.dart';

class UserDetails extends ChangeNotifier{
  String _email='';
  String _name='';

  String get Email =>_email;
  String get User => _name;

void loginName(String userName){
   _email = userName;
  notifyListeners();
}
void user(String user){
  _name = user;
  notifyListeners();
}

}