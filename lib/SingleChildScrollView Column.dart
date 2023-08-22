import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SingleScroll(),
  ));
}
class SingleScroll extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Lets Read A Story"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("TANGLED",style: GoogleFonts.playfairDisplay(
            fontWeight:FontWeight.bold,
            color: Colors.red,
            fontSize: 30
          )),
          const Image(image: NetworkImage("")),
          const SizedBox(height: 30,),
          const Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text.rich(
               TextSpan(children: [
                    TextSpan(text: 'Long ago in a kingdom, a king and his queen had a baby girl. They named her Rapunzel. The girl has golden hair and beautiful green eyes.'
                        ' Her parents were unaware that the golden hair of Rapunzel has magical healing powers. Mother Gothel was a selfish old woman who knew of the magic in Rapunzel’s hair '
                        'and wanted it to keep herself young. The old lady kidnapped the baby Rapunzel and raised her in a tower deep in the woods. She never told her that she was a princess.',style: TextStyle(fontSize: 20)),

                    TextSpan(text: 'When Rapunzel became young, she wanted to go out of the tower but Mother Gothel denied going out.'
                        ' Every year on her birthday, she used to love gazing out the tower window at the lights that floated in the night sky. '
                        'The wicked woman locked all the doors and she used to climb the tower using Rapunzel’s hair.',style: TextStyle(fontSize: 20)),
                    TextSpan(text: 'One day, Flynn Rider who was a young thief came near to the tower in order to find a place to hide'
                        ' as he had stolen something special from the castle of the King and the royal guards were after him.'
                        ' Rapunzel knocked him out with a frying pan when Flynn Rider climbed into the tower.'
                        ' She found a crown in the satchel when she secretly inspected it.',style: TextStyle(fontSize: 20)),
                    TextSpan(text: 'When Flynn Rider awoke, he found himself tied to a chair with the long hair of Rapunzel. '
                        'Tomorrow was her 18th birthday, she made a deal with him and asked him to take her to see lights, and then she would return his satchel.'
                        ' When Flynn agreed to help Rapunzel, she used her hair to climb down from the tower. ',style: TextStyle(fontSize: 20)),
                    TextSpan(text: 'It was the first time she was outside her tower. When her feet touched the grass, she almost burst with excitement.'
                        ' Both of them enjoyed their adventure, but they were being chased by the royal guards and Mother Gothel.'
                        'One morning, Rapunzel reached near to a beautiful kingdom and saw a castle sitting high above. She headed straight to it.',style: TextStyle(fontSize: 20)),
                    TextSpan(text: 'In the kingdom, she saw a painting of the King, the Queen, and their baby, who was known as the lost princess.'
                        ' The baby princess had the same golden hair and green eyes as Rapunzel.She was surprised to see this. That night she went with'
                        ' Flynn to view the floating lights, which were actually lanterns. Then the couple gazed into each others eyes and realised that they were falling in love.',style: TextStyle(fontSize: 20)),
                    TextSpan(text: 'Later, Flynn and Rapunzel were separated. Mother Gothel told Rapunzel a lie that Flynn had only wanted the crown but now '
                        'she knew the reality of Mother Gothel. She told her that she knew that she was a lost princess. Suddenly, Flynn came there to rescue Rapunzel.'
                        ' But he was hurt by Mother Gothel and she stopped Rapunzel to heal Flynn. Anyhow Flynn stood and cut off Rapunzel’s hair. As a result of this,'
                        ' Mother Gothel changed into an aged woman and turned to dust. Rapunzel was now free, but Flynn was dying. One drop of tear fell from the eyes '
                        'of Rapunzel on Flynn and healed him. Both of them came back to the castle after this. The King and Queen embraced their lost princess.'
                        ' The entire kingdom celebrated the return of their princess by launching hundreds of lanterns which were the lights that had guided her home.',style: TextStyle(fontSize: 20)),
                    // TextSpan(text: ''),

                  ]),
                ),
              ),
            ),



        ],
      ),
    );
  }
}
