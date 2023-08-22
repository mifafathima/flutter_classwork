import 'package:flutter/material.dart';
import 'package:flutter_classwork/HomePage.dart';
import 'package:flutter_classwork/stateful%20loginpage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationPage extends StatefulWidget {

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var formKey = GlobalKey<FormState>();

  bool passvisibility = true;
  bool passvisibility2 = true;
  String? password;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Registration Page",style: TextStyle(
          fontSize: 30,fontWeight: FontWeight.bold,
        ),),
      ),
      body: Form(
        key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: " Enter your FirstName",
                    labelText: "FirstName"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,bottom: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      prefixIcon: const Icon(Icons.account_circle),
                      hintText: " Enter your LastName",
                      labelText: "LastName"
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,bottom: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    prefixIcon: Icon(Icons.phone),
                    hintText:"Enter your Phone Number",
                    labelText: "Phone Number",
                  ),
                  validator: (phone){
                    if(phone!.isEmpty || phone.length < 10){
                      return "The number must be 10 digits";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 30,right: 30,bottom: 30),
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
                padding:  EdgeInsets.only(left: 30,right: 30,bottom: 30),
                child: TextFormField(
                  obscureText: passvisibility,
                  obscuringCharacter: '*',
                  decoration:  InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            if(passvisibility == true){
                              passvisibility = false ;
                            }else{
                              passvisibility = true;
                            }
                          });
                      
                    }, icon: Icon(passvisibility == true ? Icons.visibility_off : Icons.visibility)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    prefixIcon: Icon(Icons.password_outlined),
                    helperText: "Password must be atleast 8 characters",
                    hintText: "Password",
                    labelText: "Password",

                  ),
                  validator: (pass){
                    password = pass;
                    if(pass!.isEmpty || pass!.length < 8){
                      return "Feilds are empty or Password must contain atleast 8 characters";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 30,right: 30,bottom: 30),
                child: TextFormField(
                  obscureText: passvisibility2,
                  obscuringCharacter: '*',
                  decoration:  InputDecoration(
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        if(passvisibility2 == true){
                          passvisibility2 = false;
                        }else{
                          passvisibility2 = true;
                        }
                      });
                    }, icon: Icon(passvisibility2 == true ? Icons.visibility_off : Icons. visibility)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    prefixIcon: Icon(Icons.password_outlined),
                    hintText: "Re enter your password",
                    labelText: "Confirm Password",

                  ),
                  validator: (confirm){
                    if(confirm!.isEmpty || password != confirm){
                      return "Fields are empty or password does not match";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              ElevatedButton(onPressed: (){
                final valid = formKey.currentState!.validate();
                if(valid) {
                  Navigator.of(context).push(
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
              }, child: Text("Register")),
              TextButton(onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage2()));
              }, child: Text("Already a user? Login"))

            ],
          )),
    );
  }
}
