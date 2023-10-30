import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

void main() {
  runApp(MaterialApp(
    home: Readmoreless(),
  ));
}

class Readmoreless extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read more, Read less"),
      ),
      body: const Column(
        children: [
          ReadMoreText("Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications from a single codebase for any web browser, Fuchsia, Android, iOS, Linux, macOS, and Windows. First described in 2015, Flutter was released in May 2017. Wikipedia"
       " Platforms: Android, iOS, Fuchsia, Web platform, macOS, Microsoft Windows, Linux"
        "Initial release date: May 2017"
        "Programming languages: Dart, C, C++"
        "Developer: Google"
      "License: New BSD License  ",
          trimLines: 2,
          preDataText: "Flutter",
            preDataTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),
            style: TextStyle(color: Colors.deepOrangeAccent),
            colorClickableText: Colors.black,
            trimMode: TrimMode.Line,
            trimCollapsedText: "...Show More",
            trimExpandedText: "...Show Less",
          ),
          Divider(color: Colors.purpleAccent,),

          ReadMoreText("Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications from a single codebase for any web browser, Fuchsia, Android, iOS, Linux, macOS, and Windows. First described in 2015, Flutter was released in May 2017. Wikipedia"
              " Platforms: Android, iOS, Fuchsia, Web platform, macOS, Microsoft Windows, Linux"
              "Initial release date: May 2017"
              "Programming languages: Dart, C, C++"
              "Developer: Google"
              "License: New BSD License  ",
            trimLines: 2,
            preDataText: "Flutter gems",
            preDataTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),
            style: TextStyle(color: Colors.deepOrangeAccent),
            colorClickableText: Colors.black,
            trimMode: TrimMode.Line,
            trimCollapsedText: "...Show More",
            trimExpandedText: "...Show Less",
          )
        ],
      ),
    );
  }
}
