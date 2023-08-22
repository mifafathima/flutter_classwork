import 'package:flutter/material.dart';
import 'package:flutter_classwork/HomePage.dart';
import 'package:flutter_classwork/Registration%20Page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage2 extends StatefulWidget {

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {

  var formKey = GlobalKey<FormState>();
  bool showpass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login with validation"),),
      body: Form(
        key: formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Welcome Back",style: TextStyle(color: Colors.lightBlue,fontSize: 30),),
                const SizedBox(height: 10,width: 10,),
                const Text("Login to your Account",style: TextStyle(color: Colors.black,fontSize: 10),),
                Padding(
                  padding:  const EdgeInsets.all(30.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      prefixIcon: Icon(Icons.account_circle_sharp),
                      helperText: "username must be an email or phone number ",
                      hintText: "Username",
                      labelText: "Username",

                    ),
                    validator: (uname){
                      if(uname!.isEmpty || !uname.contains('@')){
                        return "Fields are empty or invalid";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,bottom: 50),
                  child: TextFormField(
                    obscureText: showpass,  // showpass = true initially ie..password is hidden
                    obscuringCharacter: '*',
                    decoration:  InputDecoration(
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          if(showpass == true){
                            showpass = false;
                          }else{
                            showpass = true;
                          }
                        });
                      },
                          icon:Icon(showpass == true ? Icons.visibility_off_sharp : Icons.visibility)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      prefixIcon: Icon(Icons.password_outlined),
                      helperText: "Password must bhe atleast 8 characters",
                      hintText: "Password",
                      labelText: "Password",

                  ),
                    validator: (pass){
                      if(pass!.isEmpty || pass!.length < 8){
                        return "Fields are empty or Password must contain atleast 8 characters";
                      }else{
                        return null;
                      }
                    },
                  )
                ),
                  ElevatedButton(onPressed: (){
                    final valid = formKey.currentState!.validate();
                    if(valid) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }else{
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

                  }, child: const Text("Login")),
                  SizedBox(height: 40,),
                  TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RegistrationPage()));
                  }, child: const Text(
                      "Not a user?! Register here "))

                ],
            ),
          )),
    );
  }
}
