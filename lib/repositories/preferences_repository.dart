import 'dart:convert';

import 'package:city_scape/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository{
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(user.toJson()));
  }

  Future<User> loadUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if(userJson != null){
      final user =  jsonDecode(prefs.getString('user')?? "");
      return User.fromJson(user as Map<String, dynamic>);
    }else{
      return User("", 0);
    }

  }
}