import 'package:flutter/material.dart';
import 'package:flutter_classwork/HomePage.dart';
import 'package:flutter_classwork/STORAGES%20IN%20FLUTTER/HIVE%20USING%20HIVE%20ADAPTER/DATABASE/HiveDB.dart';
import 'package:flutter_classwork/STORAGES%20IN%20FLUTTER/HIVE%20USING%20HIVE%20ADAPTER/SCREENS/Home_page.dart';
import 'package:flutter_classwork/STORAGES%20IN%20FLUTTER/HIVE%20USING%20HIVE%20ADAPTER/SCREENS/Registration_page.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../MODELS/User_Model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('UserData');
  runApp(MaterialApp(
    home: Login_hive(),
  ));
}

class Login_hive extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login using Hive Adapter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "EmailID",
                    hintText: "Enter your EmailId..",
                    prefixIcon: Icon(Icons.email)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: pass,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Enter your Password..",
                    prefixIcon: Icon(Icons.password)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  final userlist2 = await HiveDB.instance.getUser();
                  checkUserExits(context, userlist2);
                },
                child: const Text("Text")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Registration()));
                },
                child: const Text("Not a User? Register Here!!"))
          ],
        ),
      ),
    );
  }

  Future<void> checkUserExits(BuildContext context, List<User> userlist2) async {
    final loginemail = email.text.trim();
    final loginpass = pass.text.trim();
    bool userfound = false;
    if (loginemail != "" && loginpass != "") {
      await Future.forEach(userlist2, (singleuser) {
        if (loginemail == singleuser.email &&
            loginpass == singleuser.password) {
          userfound = true;
        } else {
          userfound = false;
        }
      });
      if (userfound == true) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Hive_Home(email : loginemail)));
      } else {
        //Get.snackbar('Failed', 'Login Failed, User not Found');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Login Failed, User not Found")));
      }
    } else {
      //Get.snackbar('error', 'Fields must not be empty');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fields must not be empty")));
    }
  }
}
