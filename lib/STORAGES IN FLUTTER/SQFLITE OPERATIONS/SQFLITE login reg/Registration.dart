import 'package:flutter/material.dart';
import 'package:flutter_classwork/STORAGES%20IN%20FLUTTER/SQFLITE%20OPERATIONS/SQFLITE%20login%20reg/Login.dart';
import 'package:flutter_classwork/STORAGES%20IN%20FLUTTER/SQFLITE%20OPERATIONS/SQFLITE%20login%20reg/sqflite%20operations.dart';


void main(){
  runApp(MaterialApp(
    home: Registration(),
  ));
}

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final pass =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Registration using Sqflite"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
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
              controller: phone,
              decoration: InputDecoration(
                  label: Text(" Phone Number"),
                  hintText: "Enter your Phone Number..",
                  prefixIcon: Icon(Icons.phone),
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: pass,
              decoration: InputDecoration(
                  label: Text("Password"),
                  hintText: "Enter your Password..",
                  prefixIcon: Icon(Icons.password),
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () async{
              await fetchuser(name.text,phone.text,pass.text);
            }, child: Text("REGISTER"))
          ],
        ),
      ),
    );
  }

  Future <void> fetchuser(String name, String phone, String pass) async{
    var id = await SQLHelper1.addNewUser(name,phone,pass);
  if(id != null){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
  }else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("INVALID")));
  }
  }

}


