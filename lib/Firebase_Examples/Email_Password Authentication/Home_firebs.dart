import 'package:flutter/material.dart';
import 'package:flutter_classwork/Firebase_Examples/Email_Password%20Authentication/Login_firebs.dart';

import 'Firebase_DB.dart';

class HomeFire extends StatelessWidget {
  const HomeFire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          FirebaseHelper().logOut().then((result) =>
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login_fb())));
        }, child: Text("SignOut")),
      ),
    );
  }
}
