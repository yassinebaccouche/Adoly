import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adol/screens/MemoryGame/ui/widgets/web/game_board.dart';
import 'package:adol/screens/MemoryGame/ui/widgets/mobile/game_board_mobile.dart';

class MemoryMatchPage extends StatelessWidget {
  const MemoryMatchPage({
    required this.gameLevel,
    Key? key, // Fix the super.key issue here
  }) : super(key: key); // Use 'super(key: key)' to pass the key parameter to the super constructor.

  final int gameLevel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgroundquiz.png'), // Use a suitable background image
              fit: BoxFit.cover,
            ),
          ),
          child: kIsWeb
              ? GameBoard(
            gameLevel: gameLevel,
          )
              : GameBoardMobile(
            gameLevel: gameLevel,
          ),
        ),
      ),
    );
  }
}
