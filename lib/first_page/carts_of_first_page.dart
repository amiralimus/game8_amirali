import 'package:flutter/material.dart';
import '../second_page/second_page.dart';//to navigating

bool isDropped = false; //to know is card dropping or no

class Carts extends StatefulWidget {
  final Color color; //to have different color for cards
  final String alphabet; //to have different alphabet  cards
  final double fontSize; //to have different fontSize for alphabet of the cards
  const Carts({
    required this.color, //to have different color for cards
    required this.alphabet, //to have different alphabet  cards
    required this.fontSize, //to have different fontSize for alphabet of the cards
    super.key,
  });

  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  bool isNotDragging = true; //to know is one of the cards dropping or no
  @override
  Widget build(BuildContext context) {
    double spacing = isNotDragging
        ? 40
        : 210; //to change the space between the cards if one of them is dropping
    return Row(
      children: [
        Draggable<String>(
          data: widget.alphabet,
          feedback: Material(
            color: Colors.transparent,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                color: widget.color, //placement different color
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 7),
              ),
              child: Center(
                child: Text(
                  widget.alphabet, //placement different alphabet
                  style: TextStyle(
                    fontSize: widget.fontSize, //placement different font size
                    color: Colors.black87,
                    fontFamily: "Vazir", //the font of the  alphabet on the card
                  ),
                ),
              ),
            ),
          ),
          childWhenDragging: const SizedBox.shrink(),
          //to dont have a copy of the cart when it's dropping
          onDragStarted: () {
            //to know is draging start or no
            setState(() {
              isNotDragging = false;
            });
          },
          onDragEnd: (details) {
            //to know is draging ended or no
            setState(() {
              isNotDragging = true;
            });
          },
          onDraggableCanceled: (velocity, offset) {
            //to know is cord Abandoned or no
            setState(() {
              isNotDragging = true;
            });
          },
          child: Container(
            //we see this card when we ar draging a card
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 7),
            ),
            child: Center(
              child: Text(
                widget.alphabet,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  color: Colors.black87,
                  fontFamily: "Vazir",
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: spacing, //the spase between the  cards
        ),
      ],
    );
  }
}

class DragTargetWidget extends StatefulWidget {
  const DragTargetWidget({super.key});

  @override
  State<DragTargetWidget> createState() => _DragTargetWidgetState();
}

class _DragTargetWidgetState extends State<DragTargetWidget> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (context, accepted, rejected) {
        return Container(//target of the cards
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: isDropped ? const Color(0xFFED9998) : Colors.cyan.shade300,//if was a card on this target and its not true card the target color will chang
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 4),
          ),
          child: const Center(
            child: Text(
              '-------------',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ),
        );
      },
      onAccept: (data) {//to set state when a card is ander the target
        setState(() {
          isDropped = true;
        });
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            isDropped = false;
          });
        });
        if (data == 'س') {//to diagnosis if the true card is in the draging target navigate to next page
          // check alphabet
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SecondPage(),
            ),
          );
        }
      },
    );
  }
}
