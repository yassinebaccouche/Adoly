import 'package:adol/screens/feed_screen.dart';
import 'package:adol/screens/users_display_chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../screens/Jeu&Quiz_screen.dart';
import '../screens/add_post_screen.dart';
import '../screens/gift_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';
import '../widgets/storys_card.dart';
const webScreenSize = 600;

List<Widget> homeScreenItems = [

  const FeedScreen(),
   GameQuiz(),
  const UserDisplay(),

  const GiftScreen(),




];