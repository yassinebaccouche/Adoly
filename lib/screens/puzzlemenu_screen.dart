import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';

import 'Puzzlegame.dart';


class PuzzleMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 380;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
      child:Container(
      width: double.infinity,
      child: Container(
        // jeu2q27 (253:119)
        padding: EdgeInsets.fromLTRB(47*fem, 10*fem, 7*fem, 94*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(20*fem),
          image: DecorationImage (
            fit: BoxFit.cover,
            image: AssetImage (
              'assets/jeu20003layer-1-bg.png',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // group6uXm (253:122)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 417*fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 38*fem,
                  height: 38*fem,
                  child: Image.asset(
                    'assets/group-6.png',
                    width: 38*fem,
                    height: 38*fem,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PuzzleWidget(),
                  ),
                );
              },
              child: Container(
                // jeu20000layer2bQb (253:128)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 39*fem, 29*fem),
                width: 287*fem,
                height: 67*fem,
                child: Image.asset(
                  'assets/jeu20000layer-2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              // jeu20001layer37dq (253:129)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 39*fem, 29*fem),
              width: 286*fem,
              height: 68*fem,
              child: Image.asset(
                'assets/jeu20001layer-3.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // jeu20002layer4dcB (253:130)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 39*fem, 0*fem),
              width: 286*fem,
              height: 68*fem,
              child: Image.asset(
                'assets/jeu20002layer-4.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}