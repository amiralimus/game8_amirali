import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; //for speaker and close icons
import '../first_page/carts_of_first_page.dart'; //for building the cards
import '../third_page/thirdpage.dart'; //to navigating to next page

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController and set the duration to 2 seconds
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define the opacity animation from 0.0 to 1.0 with a curved animation
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();

    // Navigate to the ThirdPage after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Thirdpage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    // Dispose the AnimationController to free up resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade300,
      appBar: AppBar(
        title: const Text("8game_totak"),
        backgroundColor: Colors.cyan.shade300,
      ),
      body: Stack(
        children: [
          // Position the icon buttons at the top left corner
          Positioned(
            top: 16.6,
            left: 16.6,
            child: Column(
              children: [
                IconButton(
                  icon: SvgPicture.asset('assets/icons/close.svg',
                      width: 90, height: 90),
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                IconButton(
                  icon: SvgPicture.asset('assets/icons/speaker.svg',
                      width: 90, height: 90),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Center the main content
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                // Apply the fade transition to the Carts widget
                FadeTransition(
                  opacity: _opacityAnimation,
                  child: Carts(
                    fontSize: 140,
                    alphabet: 'سـ',
                    color: Colors.pink.shade200,
                  ),
                ),
                const SizedBox(width: 10),
                // Display the text with custom style
                Text(
                  'ـتاره',
                  style: TextStyle(
                    fontSize: 222,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Vazir",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
