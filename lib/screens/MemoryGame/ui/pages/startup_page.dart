import 'package:flutter/material.dart';
import 'package:adol/screens/MemoryGame/ui/widgets/game_options.dart';
import 'package:adol/screens/MemoryGame/utils/constants.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/starting-screen.png'), // Use a suitable background image
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              children: const [
                Text(
                  'DAWINI',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20), // Add some vertical spacing
                GameOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
