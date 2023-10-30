import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../MODELS/User_Model.dart';

class HiveDB{

  HiveDB.internal();

  static HiveDB instance = HiveDB.internal();

  factory HiveDB(){   //factory constructor for creating singleton class(these class have only one instance)
    return instance;
  }
  //add user email and password to hive db
  Future<void> addUser(User user) async{
    final db = await Hive.openBox<User>('UserData');
    db.put(user.id, user);
  }
  //read or  user data's from hive db
Future<List<User>> getUser() async{
  final db = await Hive.openBox<User>('UserData');
  return db.values.toList();

}

}