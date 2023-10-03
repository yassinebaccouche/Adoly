import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender; // Add a property to determine if the message is sent or received

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isSender, // Initialize it in the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isSender ? 12 : 0),
          topRight: Radius.circular(isSender ? 0 : 12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        color: isSender ? Colors.blue : Colors.grey[300],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 16,
          color: isSender ? Colors.white : Colors.black,
          fontFamily: 'Inter',// Adjust text color based on sender/receiver
        ),
      ),
    );
  }
}
