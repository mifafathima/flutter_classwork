import 'package:flutter/material.dart';
import 'package:flutter_classwork/splash%203.dart';
import 'package:flutter_classwork/stateful%20loginpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: IntroScreen(),
  ));
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = PageDecoration(

        titleTextStyle: TextStyle(
            fontSize: 40, fontWeight: FontWeight.w700, color: Colors.purple),
        bodyTextStyle: GoogleFonts.dancingScript(
            fontStyle: FontStyle.italic,
            color: Colors.pinkAccent,
            fontSize: 20),
        boxDecoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.lightBlue, Colors.white, Colors.lightBlue])));
    return IntroductionScreen(
      pages: [
        PageViewModel(
            decoration: pageDecoration,
            title: "First page",
            body:
                "Introduction screen shows the details of the app and demo pages",
            image: introimage(
                "https://images.unsplash.com/photo-1629192819661-6669f030b20f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDcwfENEd3V3WEpBYkV3fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60")),
        PageViewModel(
            decoration: pageDecoration,
            title: "Second page",
            body:
                "Introduction screen shows the details of the app and demo pages",
            image: introimage(
                "https://images.unsplash.com/photo-1651238029038-1922acc3abfe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDcyfENEd3V3WEpBYkV3fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60")),
        PageViewModel(
            decoration: pageDecoration,
            title: "Third page",
            body:
                "Introduction screen shows the details of the app and demo pages",
            image: introimage(
                "https://images.unsplash.com/photo-1685914287307-d2155a6b898f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDEyfENEd3V3WEpBYkV3fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=1000&q=60"))
      ],
      onDone: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Splash3())),
      onSkip: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage2())),
      showSkipButton: true,
      skip: Text("Skip"),
      next: Icon(Icons.arrow_forward),
      done: Text("Done"),
      dotsDecorator: DotsDecorator(
          size: Size(10, 12),
          color: Colors.grey,
          activeColor: Colors.purple,
          activeSize: Size(25, 12),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    );
  }

  //custom widget
  Widget introimage(String Simage) {  //creating a widget by our own : refactoring widget
    return Center(
      child: Container(   //we can give here anything card container or anything
        height: 600,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
                image: NetworkImage(
          Simage,
        ))),
      ),
    );
  }
}
