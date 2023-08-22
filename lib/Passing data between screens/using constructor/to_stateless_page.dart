import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatelessPage1 extends StatelessWidget {
  String? name;

  String? location;

  int? Phone;

    StatelessPage1({super.key, required  this.name, required this.location, this.Phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name!,style: GoogleFonts.alice(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purple
              ),),
              Text(location!,style: GoogleFonts.alice(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent
              ),),
              Text('$Phone',style: GoogleFonts.alice(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
              ),)
            ],
          )

        )
        ),
      );
  }
}
