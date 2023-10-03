import 'package:adol/screens/Dawini_menu_screen.dart';
import 'package:adol/screens/puzzlemenu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

import '../providers/user_provider.dart';
import 'Quiz/Quiz_screen.dart';
import 'gift_screen2.dart';

class GameQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    double baseWidth = 380;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20 * fem),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(24 * fem, 5 * fem, 24 * fem, 11 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 4 * fem, 51 * fem),
                      width: double.infinity,
                      height: 60 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 157 * fem, 0 * fem),
                            width: 111 * fem,
                            height: 44 * fem,
                            child: Image.asset(
                              'assets/accroche-adol-2-Tfd.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: 60 * fem,
                            height: double.infinity,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0 * fem,
                                  top: 0 * fem,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 157 * fem, 0 * fem),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(userProvider.getUser.photoUrl),
                                        radius: 30 * fem, // Adjust the radius to your desired size
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 43 * fem,
                                  top: 0 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 14 * fem,
                                      height: 14 * fem,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(24 * fem),
                                          color: Color(0xffa80008),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 47 * fem,
                                  top: 1 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 6 * fem,
                                      height: 13 * fem,
                                      child: Text(
                                        '1',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 10 * fem),
                      child: Text(
                        'JEUX',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 24 * fem, // Adjust the font size as needed
                          fontWeight: FontWeight.bold, // Adjust the font weight as needed
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 13 * fem),
                      padding: EdgeInsets.fromLTRB(20 * fem, 13 * fem, 15 * fem, 13 * fem),
                      width: double.infinity,
                      height: 259 * fem,
                      decoration: BoxDecoration(
                        color: Color(0x33273085),
                        borderRadius: BorderRadius.circular(20 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          GestureDetector(
                          onTap: () {
                    Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (context) => DawiniMenu(),
                    ),
                    );
                    },

                      child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 0.5 * fem,
                                sigmaY: 0.5 * fem,
                              ),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 21 * fem, 0 * fem),
                                width: 137 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20 * fem),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/c.png',
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3f000000),
                                      offset: Offset(0 * fem, 4 * fem),
                                      blurRadius: 2 * fem,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Dawini',
                                    style: TextStyle(
                                      fontSize: 40 * fem,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      shadows: [
                                        Shadow(
                                          offset: Offset(2, 2),
                                          color: Colors.black.withOpacity(0.5),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Quiz 2
                          GestureDetector(
                            onTap: () {

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PuzzleMenu(),
                                  ),
                                );

                              // Handle Quiz 2 click
                              // You can navigate to another page here.
                            },
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 0.5 * fem,
                                sigmaY: 0.5 * fem,
                              ),
                              child: Container(
                                width: 139 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20 * fem),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/b.png',
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3f000000),
                                      offset: Offset(0 * fem, 4 * fem),
                                      blurRadius: 2 * fem,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Puzzle',
                                    style: TextStyle(
                                      fontSize: 34 * fem,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      shadows: [
                                        Shadow(
                                          offset: Offset(2, 2),
                                          color: Colors.black.withOpacity(0.5),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'QUIZ',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24 * fem, // Adjust the font size as needed
                        fontWeight: FontWeight.bold, // Adjust the font weight as needed
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 361 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      left: 24 * fem,
                      top: 0 * fem,
                      child: Align(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => QuizgameScreen(),
                              ),
                            );
                            // Handle Quiz 1 click
                            // You can navigate to another page here.
                          },
                          child: SizedBox(
                            width: 332 * fem,
                            height: 259 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: Color(0x33273085),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 44 * fem,
                      top: 12 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 136 * fem,
                          height: 227 * fem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20 * fem),
                            child: Image.asset(
                              'assets/rectangle-7-bg.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 51 * fem,
                      top: 102 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 122 * fem,
                          height: 49 * fem,
                          child: Center(
                            child: Text(
                              'Quiz 1',
                              style: TextStyle(
                                fontSize: 42 * fem,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontFamily: 'Inter',
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 199 * fem,
                      top: 12 * fem,
                      child: Align(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => QuizgameScreen(),
                              ),
                            );
                            // Handle Quiz 2 click
                            // You can navigate to another page here.
                          },
                          child: SizedBox(
                            width: 143 * fem,
                            height: 227 * fem,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20 * fem),
                              child: Image.asset(
                                'assets/rectangle-10-bg-cST.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 207 * fem,
                      top: 102 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 128 * fem,
                          height: 49 * fem,
                          child: Text(
                            'Quiz 2',
                            style: TextStyle(
                              fontSize: 42 * fem,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontFamily: 'Inter',
                              shadows: [
                                Shadow(
                                  offset: Offset(2, 2),
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}