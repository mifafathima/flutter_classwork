import 'package:flutter/material.dart';
import 'package:flutter_classwork/Firebase_Examples/Email_Password%20Authentication/Firebase_DB.dart';
import 'package:flutter_classwork/Firebase_Examples/Email_Password%20Authentication/Login_firebs.dart';

class Register_fb extends StatefulWidget {
  const Register_fb({super.key});

  @override
  State<Register_fb> createState() => _Register_fbState();
}

class _Register_fbState extends State<Register_fb> {

  final uname_controller = TextEditingController();
  final pass_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration using firebase"),
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
                    prefixIcon: Icon(Icons.person)
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
                  prefixIcon: Icon(Icons.password)
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              String email = uname_controller.text.trim();
              String pass = pass_controller.text.trim();
              FirebaseHelper().register(useremail : email, password : pass).then((result){
                if(result == null){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login_fb()));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                }
              });
            }, child: Text("Register Here!!"))
          ],
        ),
      ),
    );
  }
}
