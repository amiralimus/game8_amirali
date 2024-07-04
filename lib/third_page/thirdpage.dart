import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

// StatefulWidget for the third page
class Thirdpage extends StatefulWidget {
  const Thirdpage({super.key});

  @override
  State<Thirdpage> createState() => _ThirdpageState();
}

// State class for the Thirdpage
class _ThirdpageState extends State<Thirdpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with title and background color
      appBar: AppBar(
        title: const Text('8game_totak'), // Title of the app bar
        backgroundColor: Colors.cyan.shade300, // Background color of the app bar
      ),
      backgroundColor: Colors.cyan.shade300, // Background color of the screen

      // Body of the screen inside a SingleChildScrollView
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Positioned widget to place the close and speaker icons at the top left corner
            Positioned(
              top: 16.6, // Distance from the top
              left: 16.6, // Distance from the left
              child: Column(
                children: [
                  // Close icon button
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/close.svg', // Path to the close icon SVG
                      width: 90, // Width of the icon
                      height: 90, // Height of the icon
                    ),
                    onPressed: () {
                      // Action when the close button is pressed
                    },
                  ),
                  const SizedBox(height: 10), // Spacer between the icons
                  // Speaker icon button
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/speaker.svg', // Path to the speaker icon SVG
                      width: 90, // Width of the icon
                      height: 90, // Height of the icon
                    ),
                    onPressed: () {
                      // Action when the speaker button is pressed
                    },
                  ),
                ],
              ),
            ),
            // Centering the text in the middle of the screen using a Column
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
              crossAxisAlignment: CrossAxisAlignment.center, // Center the children horizontally
              children: [
                const SizedBox(height: 40), // Spacer to push the text down
                Center(
                  child: Text(
                    'ستاره', // Text to display
                    style: TextStyle(
                      fontSize: 222, // Font size of the text
                      color: Colors.blue.shade700, // Text color
                      fontWeight: FontWeight.bold, // Font weight
                      fontFamily: "Vazir", // Font family
                    ),
                  ),
                ),
              ],
            ),
            // Lottie animation for confetti effect centered on the screen
            Align(
              alignment: Alignment.center, // Align the Lottie animation to the center
              child: Lottie.asset(
                'assets/Confetti-original.json', // Path to the Lottie animation JSON file
                fit: BoxFit.cover, // Fit the animation to cover the available space
              ),
            ),
          ],
        ),
      ),
    );
  }
}
