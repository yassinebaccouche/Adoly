import 'package:adol/providers/user_provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adol/widgets/NavBar.dart';

import 'package:adol/models/user.dart' as model;

import '../utils/global_variables.dart';
class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _page); // Initialize with the current page
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    // Animating Page and updating the selected page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30, color: (_page == 0) ? Colors.white : Colors.white),
      Icon(Icons.gamepad, size: 30, color: (_page == 1) ? Colors.white : Colors.white),
      Icon(Icons.message, size: 30, color: (_page == 2) ? Colors.white : Colors.white),
      Icon(Icons.attach_money, size: 30, color: (_page == 3) ? Colors.white : Colors.white),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Image.asset(
          'assets/accroche-adol-1.png',
          height: 32,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.messenger_outline,
              color: Colors.cyan,
            ),
            onPressed: () {
              navigationTapped(2);
              // Add your logic for handling the messenger icon tap here
            },
          ),
        ],
      ),
      drawer: NavBar(),
      body: PageView(
        children: homeScreenItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xff0031ff),
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        items: items,
        onTap: navigationTapped,
        index: _page, // Set the initial selected page index
      ),
    );
  }
}
