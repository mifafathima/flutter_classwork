import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ExitAppAlert(),
  ));
}
class ExitAppAlert extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future<bool> showAlert() async {
      return await showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Exit!"),
          content: Text("Do you really want to exit?!"),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop;
            }, child: Text("YES")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop(false);
            }, child: Text("NO")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop(false);
            }, child: Text("CANCEL")),

          ],
        );
      });
    }
    return WillPopScope(
      onWillPop: showAlert,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Exit from App"),
          ),
          body: Center(
            child: Text("Press Back Button to Exit!!"),
          ),
        ),

    );
  }


}
