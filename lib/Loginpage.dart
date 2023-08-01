
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'HomePage.dart';

class LoginPage extends StatelessWidget{
  String uname = "Mifa";
  String pwd = "Mifa8888";

  TextEditingController usercontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle,size: 80,color: Colors.lightBlue,),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: usercontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.account_circle_sharp),
                  hintText: "User name",
                  helperText: "Username must be an email or phone number",
                  labelText: "Username",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,bottom: 40),
              child: TextField(
                controller: passcontroller,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: const InputDecoration(
                  border:OutlineInputBorder(),
                  prefixIcon: Icon(Icons.remove_red_eye_outlined),
                  hintText: "Password",
                  helperText: "Password must be atleast 8 characters including string,number.",
                  labelText: "Password",
                ),
              ),
            ),
            
            ElevatedButton(onPressed: (){
              if (uname == usercontroller.text && pwd == passcontroller.text) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomePage()));
                usercontroller.text = "";
                passcontroller.text= "";
              }else{
                // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("invalid username or password"),
                //   backgroundColor: Colors.blue,
                // ));
                Fluttertoast.showToast(
                    msg: "invalid username or password",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    //timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );

              }
            }, child: const Text(
              "Login",
            )),


          ],
        ),
      ),
    );
  }

}