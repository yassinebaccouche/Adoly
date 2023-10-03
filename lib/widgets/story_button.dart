import 'package:adol/models/story.dart';
import 'package:adol/screens/story_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget StoryButton(StoryData story, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50.0),
          onTap: () {
            // Handle the onTap action here if needed
            Navigator.push(context, new MaterialPageRoute(builder: (context)=>StoryScreen(story: story)));
          },
          child: Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(color: Colors.blue, width: 2.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                    image: NetworkImage(story.avatarURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5.0), // Add some spacing between the image and the username
        Text(
          story.pseudo,
          style: TextStyle(
            fontSize: 12.0, // Adjust the font size as needed
            fontWeight: FontWeight.bold, // Adjust the font weight as needed
          ),
        ),
      ],
    ),
  );
}
