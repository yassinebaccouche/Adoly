import 'package:adol/models/story.dart';
import 'package:adol/widgets/story_button.dart';
import 'package:flutter/material.dart';
class StoryApp extends StatefulWidget {
  const StoryApp({Key? key}) : super(key: key);

  @override
  State<StoryApp> createState() => _StoryAppState();
}

class _StoryAppState extends State<StoryApp> {
  List<StoryData> stories =[
    new StoryData(
        "lorina vrak",
        "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aHVtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60",
        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"),
    new StoryData(
        "majid krov",
        "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aHVtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60",
        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"),
    new StoryData(
        "yessin baccouche",
        "https://plus.unsplash.com/premium_photo-1664203573232-1074bf1e7cac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aHVtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60",
        "https://plus.unsplash.com/premium_photo-1664203573232-1074bf1e7cac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aHVtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"),
    new StoryData(
        "seif",
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80",
        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"),
    new StoryData(
        "yessin baccouche",
        "https://plus.unsplash.com/premium_photo-1664203573232-1074bf1e7cac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aHVtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60",
        "https://plus.unsplash.com/premium_photo-1664203573232-1074bf1e7cac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aHVtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"),
    new StoryData(
        "yessin baccouche",
        "https://plus.unsplash.com/premium_photo-1664203573232-1074bf1e7cac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aHVtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60",
        "https://plus.unsplash.com/premium_photo-1664203573232-1074bf1e7cac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aHVtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 105.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < stories.length; i++)
                    StoryButton(stories[i], context),

                  // Add more StoryButton widgets as needed
                ],
              ),
            ),

          )


        ],

      ),


    );
  }
}
