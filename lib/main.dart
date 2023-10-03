import 'package:adol/providers/user_provider.dart';

import 'package:adol/screens/gift_screen2.dart';
import 'package:adol/screens/signup_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'Screens/signin_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCzA6qTchzKCjIvJippBtqb3sj1LL6UNo4",
          authDomain: "adol-2789a.firebaseapp.com",
          projectId: "adol-2789a",
          storageBucket: "adol-2789a.appspot.com",
          messagingSenderId: "345522697739",
          appId: "1:345522697739:web:ab291843dd7c46520d790e"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  await FirebaseAuth.instance.currentUser;


  runApp(const MyApp(

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Fix the constructor syntax

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.active) {
      // Checking if the snapshot has any data or not
      if (snapshot.hasData) {
      // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout

      }
      }

      // means connection to future hasnt been made yet
      if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
      child: CircularProgressIndicator(),
      );
      }


      return    SignInScreen();
      },
      ),

      ),
    );
  }
}
