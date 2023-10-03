import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';

import 'MemoryGame/ui/pages/startup_page.dart';
import 'Puzzlegame.dart';


class DawiniMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 380;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // jeu1gxX (253:104)
        width: double.infinity,
        height: 820*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(20*fem),
        ),
        child: Stack(
          children: [
            Positioned(
              // jeu10005layer1DSf (253:113)
              left: 0*fem,
              top: 3*fem,
              child: Align(
                child: SizedBox(
                  width: 377*fem,
                  height: 816*fem,
                  child: Image.asset(
                    'assets/jeu10005layer-1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // jeu10003layer2Jj1 (253:117)
              left: 0*fem,
              top: 330*fem,
              child: Align(
                child: SizedBox(
                  width: 377*fem,
                  height: 489*fem,
                  child: Image.asset(
                    'assets/jeu10003layer-2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // jeu10004layer6RHq (253:112)
              left: 333*fem,
              top: 15*fem,
              child: Align(
                child: SizedBox(
                  width: 27*fem,
                  height: 28*fem,
                  child: Image.asset(
                    'assets/jeu10004layer-6.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // jeu10000layer39Dq (253:114)
              left: 116 * fem,
              top: 524 * fem,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => StartUpPage(),
                    ),
                  );
                },
                child: Container(
                  child: Align(
                    child: SizedBox(
                      width: 150 * fem,
                      height: 47 * fem,
                      child: Image.asset(
                        'assets/jeu10000layer-3.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              // jeu10001layer4U1D (253:115)
              left: 116*fem,
              top: 587*fem,
              child: Align(
                child: SizedBox(
                  width: 149*fem,
                  height: 47*fem,
                  child: Image.asset(
                    'assets/jeu10001layer-4.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // jeu10002layer5BwD (253:116)
              left: 115*fem,
              top: 650*fem,
              child: Align(
                child: SizedBox(
                  width: 151*fem,
                  height: 46*fem,
                  child: Image.asset(
                    'assets/jeu10002layer-5.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}