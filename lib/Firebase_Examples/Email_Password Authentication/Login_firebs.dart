import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_classwork/Firebase_Examples/Email_Password%20Authentication/Firebase_DB.dart';
import 'package:flutter_classwork/Firebase_Examples/Email_Password%20Authentication/Registration_firebs.dart';

import 'Home_firebs.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:  const FirebaseOptions(
      apiKey: "AIzaSyC9eAirjmsctohEN7aOLYPjA-bKIYWYpQE",
      projectId: "fir-project-3abe8",
      appId: '1:437733634646:android:285a59c2c4474699bdc1f7',
      messagingSenderId: '',
    ),
  );
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    home: user == null ? const Login_fb() : const HomeFire(),
  ));
}

class Login_fb extends StatefulWidget {
  const Login_fb({super.key});

  @override
  State<Login_fb> createState() => _Login_fbState();
}

class _Login_fbState extends State<Login_fb> {

  final uname_controller = TextEditingController();
  final pass_controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login using firebase"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: uname_controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    hintText: "Username",
                    prefixIcon: const Icon(Icons.person)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: pass_controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.password)
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              String email = uname_controller.text.trim();
              String password = pass_controller.text.trim();

              FirebaseHelper().login(
                  email : email,
                  password : password).then((result){
                if(result == null){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeFire()));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                  }

              });
            }, child: const Text("Login Here!!")),
            const SizedBox(height: 30,),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Register_fb()));
            }, child: const Text("Register Here!!"))
          ],
        ),
      ),
    );
  }
}
