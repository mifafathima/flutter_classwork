import 'package:flutter/material.dart';
import 'package:flutter_classwork/STORAGES%20IN%20FLUTTER/SHARED%20PREFERENCES%201/Simple%20login%20using%20shared%20preferences/Shared-login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared_Home extends StatefulWidget {
  const Shared_Home({super.key});

  @override
  State<Shared_Home> createState() => _Shared_HomeState();
}

class _Shared_HomeState extends State<Shared_Home> {
  late SharedPreferences preferences;
  late String username;

  @override
  void initState() {
    fetchdata();
    super.initState();
  }
  void fetchdata() async{
    preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('uname')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("WELCOME $username"),
            const SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
              preferences.setBool('newuser', true);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Shared_Login()));
            }, child: Text("LOGOUT"))
          ],
        ),
      ),
    );
  }


}
