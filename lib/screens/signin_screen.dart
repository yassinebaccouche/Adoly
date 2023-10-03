import 'package:adol/resources/auth-methode.dart';
import 'package:adol/responsive/mobile_screen_layout.dart';
import 'package:adol/responsive/responsive_layout_screen.dart';
import 'package:adol/responsive/web_screen_layout.dart';
import 'package:adol/screens/update_screen.dart';

import 'package:adol/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethodes().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == 'success') {
      User loggedInUser = await getUserDetailsByEmail(_emailController.text);

      if (context.mounted) {
        if (loggedInUser.Verified == "0") {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UpdateScreen(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebScreenLayout(),
              ),
            ),
          );
        }

        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      if (context.mounted) {
        showSnackBar(context, res);
      }
    }
  }





  @override
  Widget build(BuildContext context) {
    double baseWidth = 350;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body:SafeArea(
      child:GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < -0) {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return DraggableScrollableSheet(
                  initialChildSize: 1.0, // Start fully open
                  minChildSize: 0.5, // Minimum height when sheet is collapsed
                  maxChildSize: 1.0, // Maximum height when sheet is fully expanded

                  expand: false, // Set to true if you want it to fully cover the screen
                  builder: (BuildContext context, ScrollController scrollController) {
                    return SingleChildScrollView( // Wrap with SingleChildScrollView
                      controller: scrollController,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          Container(
                            width: double.infinity,
                            height: 5, // Height of the blue line
                            color: Colors.blue, // Color of the blue line
                          ),
                          Container( // Wrap the Expanded with a Container
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 16 * fem),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(height: 30.0),
                                Text(
                                  'Identifiez vous',

                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff273085),
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                SizedBox(height: 33.0),
                                //textfiled identifiant
                                Container(
                                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 11 * fem),
                                  width: double.infinity,
                                  height: 54 * fem,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0 * fem,
                                        top: 0 * fem,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: 307.17 * fem,
                                            height: 54 * fem,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50 * fem),
                                              border: Border.all(color: Color(0xff273085)),
                                            ),

                                            child: TextFormField(

                                              controller: _emailController,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(

                                                fontSize: 16 * ffem,
                                                color: Color(0xff273085),
                                              ),
                                              textAlignVertical: TextAlignVertical.center,
                                              decoration: InputDecoration(

                                                border: InputBorder.none,
                                                hintText: 'Identifiant',
                                                hintStyle: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 16 * ffem,
                                                  color: Color(0xff273085).withOpacity(0.5),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please enter the Identifiant';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16 * fem),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 11 * fem),
                                  width: double.infinity,
                                  height: 54 * fem,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0 * fem,
                                        top: 0 * fem,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: 307.17 * fem,
                                            height: 54 * fem,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50 * fem),
                                              border: Border.all(color: Color(0xff273085)),
                                            ),
                                            child: TextFormField(
                                              controller: _passwordController,
                                              obscureText: true, // This masks the input as a password
                                              textAlign: TextAlign.center,
                                              style: TextStyle(

                                                fontSize: 16 * ffem,
                                                color: Color(0xff273085),
                                              ),
                                              textAlignVertical: TextAlignVertical.center,
                                              decoration: InputDecoration(

                                                border: InputBorder.none,
                                                hintText: 'Mot de passe',
                                                hintStyle: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 16 * ffem,
                                                  color: Color(0xff273085).withOpacity(0.5),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please enter the Mot de passe';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.0),

                                Container(
                                  margin: EdgeInsets.fromLTRB(79 * fem, 0 * fem, 78.28 * fem, 0 * fem),
                                  width: double.infinity,
                                  height: 54 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50 * fem),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3f000000),
                                        offset: Offset(0 * fem, 4 * fem),
                                        blurRadius: 2 * fem,
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(

                                    onPressed: () {
                                      loginUser();

                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff273085), // Change to your desired blue color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50 * fem),
                                      ),
                                      elevation: 2 * fem,
                                    ),
                                    child: !_isLoading
                                        ? const Text(
                                      'Connecter',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                      ),
                                    )
                                        : CircularProgressIndicator(
                                      color: Colors.blue, // Replace with the desired color
                                    ),

                                  ),
                                  ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          }
        },
        child: Container(
          width: double.infinity,
          child: Container(
            width: double.infinity,
            height: 1050 * fem,
            decoration: BoxDecoration(
              color: Color(0xffffffff),

              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/backgroundSignin.png'),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 61 * fem,
                  top: 116 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 309 * fem,
                      height: 660 * fem,
                      child: Image.asset(
                        'assets/char.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 90.4443359375 * fem,
                  top: 31.7479248047 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 250.78 * fem,
                      height: 96.81 * fem,
                      child: Image.asset(
                        'assets/accroche-adol-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
Future<User> getUserDetailsByEmail(String email) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: email)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    return User.fromSnap(querySnapshot.docs[0]);
  } else {
    throw Exception("User not found");
  }
}
