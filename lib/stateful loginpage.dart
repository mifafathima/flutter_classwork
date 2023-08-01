import 'package:flutter/material.dart';

class LoginPage2 extends StatefulWidget {

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login with validation"),),
      body: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.account_circle_sharp),
                      helperText: "username must be an email or phone number ",
                      hintText: "Username",
                      labelText: "Username",


                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,bottom: 50),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.account_circle_sharp),
                      helperText: "Password must bhe atleast 8 characters",
                      hintText: "Password",
                      labelText: "Password",

                  ),
                  )
                ),
                  ElevatedButton(onPressed: (){}, child: const Text("Login")),
                  TextButton(onPressed: (){}, child: const Text(
                      "Not a user?! Register here "))

                ],
            ),
          )),
    );
  }
}
