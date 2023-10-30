import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Shared-home.dart';

void main() {
  runApp(const MaterialApp(
    home: Shared_Login(),
  ));
}

class Shared_Login extends StatefulWidget {
  const Shared_Login({super.key});

  @override
  State<Shared_Login> createState() => _Shared_LoginState();
}

class _Shared_LoginState extends State<Shared_Login> {
  final email = TextEditingController();
  final pass = TextEditingController();
  late SharedPreferences preferences;
  late bool newuser;

  @override
  void initState() {
    check_if_user_already_login();
    super.initState();
  }
  void check_if_user_already_login() async{
    preferences = await SharedPreferences.getInstance();
    newuser = preferences.getBool('userlogin') ?? true;

    if(newuser == false){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Shared_Home()));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Login Using Shared"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      hintText: "Enter your Email ID",
                      labelText: "Email"),
                  controller: email,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password_rounded),
                      hintText: "Enter your Password",
                      labelText: "Password"),
                  controller: pass,
                ),
              ),
              ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //   padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(40)
                  //   ),
                  //
                  // ),
                  onPressed: () async {
                    //shared preference instance creation // preference is the object
                    preferences = await SharedPreferences.getInstance();

                    String username = email.text;
                    String password = pass.text;

                    if (username != "" && password != "") {
                      preferences.setString('uname', username);
                      preferences.setString('pwd', password);
                      preferences.setBool('userlogin', true);  //set the user logged in
                    }
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Shared_Home()));

                    email.text = "";
                    pass.text = "";
                  },
                  child: const Text("LOGIN"))
            ],
          ),
        ));
  }


}
