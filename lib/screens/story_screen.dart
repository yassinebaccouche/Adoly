import 'dart:async';

import 'package:adol/models/story.dart';
import 'package:flutter/material.dart';
class StoryScreen extends StatefulWidget {
  final StoryData story;
  const StoryScreen({Key? key,required this.story}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  double percent = 0.0;
  late Timer _timer;
  void StartTimer(){
    _timer=Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        percent += 0.003;
        if(percent >= 1 ){
          _timer.cancel();
          Navigator.pop(context);
        }
      });

    });
  }
  @override
  void initState() {
    StartTimer();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Container(
      width: double.infinity,
             height: double.infinity,
             decoration: BoxDecoration(
               image: DecorationImage(image: NetworkImage(widget.story.storyURL),
               fit:BoxFit.cover,
               ),
             ),
           ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 36.0,horizontal: 8.0),
            child: Column(
              children: [
                LinearProgressIndicator(
                 value: percent,
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(widget.story.avatarURL),
                    radius: 30.0,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(widget.story.pseudo,style: TextStyle(
                      fontWeight: FontWeight.bold, color:Colors.blue ,fontSize: 18.0, fontFamily: 'Inter',), ),

                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
