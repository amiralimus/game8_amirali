import 'dart:math'; //for rotating the cards
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; //for speaker and close icons
import 'carts_of_first_page.dart'; //for building the cards

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("8game_totak "),
          backgroundColor: Colors.cyan.shade300,
        ),
        backgroundColor: Colors.cyan.shade300,
        body: SingleChildScrollView(
          child: Stack(//to Placement speaker and close icons
              children: [
            Positioned(
              top: 16.6,
              left: 16.6,
              child: Column(
                children: [
                  IconButton(
                    icon:
                        SvgPicture.asset('assets/icons/close.svg', //close icon
                            width: 90,
                            height: 90),
                    onPressed:
                        () {}, //space between the speaker and close icons
                  ),
                  const SizedBox(height: 9.5),
                  IconButton(
                    icon: SvgPicture.asset(
                        'assets/icons/speaker.svg', //speaker icon
                        width: 90,
                        height: 90),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ـتاره',
                      style: TextStyle(
                        fontSize: 222.2,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                        fontFamily: "Vazir",
                      ),
                    ),
                    const DragTargetWidget(), //target for the cards
                  ],
                ),
                const SizedBox(
                  height: 88.8,
                ), //space between the word and cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.rotate(
                        angle: 3 * 180, //to roding the card
                        child: Carts(
                          fontSize: 88, //font size of the  alphabet
                          color: Colors.orange.shade300, //color of the cad
                          alphabet: 'ب', // alphabet on the card
                        )),
                    Transform.rotate(
                        angle: -2.6 * pi / 180, //to roding the card
                        child: Carts(
                          fontSize: 88, //font size of the  alphabet
                          color: Colors.pink.shade200, //color of the cad
                          alphabet: 'س', // alphabet on the card
                        )),
                    Transform.rotate(
                        angle: 3 * 180, //to roding the card
                        child: Carts(
                          fontSize: 88, //font size of the  alphabet
                          color: Colors.green.shade300, //color of the cad
                          alphabet: 'چ', // alphabet on the card
                        )),
                    Transform.rotate(
                        angle: 3 * pi / 180, //to roding the card
                        child: Carts(
                          fontSize: 88, //font size of the  alphabet
                          color: Colors.yellow.shade300, //color of the cad
                          alphabet: 'ز', // alphabet on the card
                        )),
                  ],
                ),
                const SizedBox(
                  height: 22.2,
                ) //space for the down of the page
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
