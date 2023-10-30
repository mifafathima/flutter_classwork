import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login Page"),
      ),
      body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    TextField(
    decoration: InputDecoration(
    label: Text("FullName"),
    hintText: "Enter your Full Name..",
    prefixIcon: Icon(Icons.person),
    border:OutlineInputBorder(
    borderRadius: BorderRadius.circular(10)
    )
    ),
    ),
    SizedBox(height: 20,),
    TextField(
    decoration: InputDecoration(
    label: Text(" Password"),
    hintText: "Enter your Password.",
    prefixIcon: Icon(Icons.password),
    border:OutlineInputBorder(
    borderRadius: BorderRadius.circular(10)
    )
    ),
    ),
      SizedBox(height: 30,),
      ElevatedButton(onPressed: (){}, child: Text("LOGIN"))
    ]
    ))
    );
  }
}
