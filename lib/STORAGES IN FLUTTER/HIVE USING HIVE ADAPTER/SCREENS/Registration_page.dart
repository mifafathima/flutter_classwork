import 'dart:html';
import 'dart:js';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_classwork/STORAGES%20IN%20FLUTTER/HIVE%20USING%20HIVE%20ADAPTER/DATABASE/HiveDB.dart';
import 'package:flutter_classwork/STORAGES%20IN%20FLUTTER/HIVE%20USING%20HIVE%20ADAPTER/MODELS/User_Model.dart';
import 'package:flutter_classwork/STORAGES%20IN%20FLUTTER/HIVE%20USING%20HIVE%20ADAPTER/SCREENS/Login_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('UserData');
  runApp(MaterialApp(home: Registration(),));
}

class Registration extends StatelessWidget {

final email1 =TextEditingController();
final pass1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Registration using Hive Adapter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller:email1,
                decoration: InputDecoration(
                  hintText: "Enter your EmailID",
                  labelText: "EmailID",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: pass1,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: () async{
              //fetch all the users from db
              final userlist = await HiveDB.instance.getUser();
              validateSignUp(context,userlist);

            }, child: const Text("REGISTER"))
          ],
        ),
      ),
    );
  }

  Future<void> validateSignUp(BuildContext context,List<User> userlist) async{
    final uname = email1.text.trim();
    final password = pass1.text.trim();
    bool userfound = false;
    final validateEmail = EmailValidator.validate(uname);
    if(uname != "" && password != "") {
      if (validateEmail == true) {
        await Future.forEach(userlist, (singleuser) {
          if (singleuser.email == uname) {
            userfound = true;
          } else {
            userfound = false;
          }
        });
        if (userfound == true) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("User already exists!!")));
        } else {
          final validatepassword = validatePassword(context, password);
          if (validatepassword == true) {
            final user = User(email: uname, password: password);
            await HiveDB.instance.addUser(user); //user added to hive
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Login_hive()));
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(" User Registration Success!!!!!")));
          }
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter a avalid email")));
      }
      }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Feilds must not be empty")));
    }
  }

  bool validatePassword(BuildContext context,String password) {
    if(password.length < 6 ){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password length must be atleast 6 characters ")));
      return false;
    }else{
      return true;
    }
  }

}
