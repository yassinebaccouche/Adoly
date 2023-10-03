import 'dart:typed_data';
import 'package:adol/resources/chat_methode.dart';
import 'package:adol/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserID;
  final String receiverUserEmail;

  const ChatPage({
    Key? key,
    required this.receiverUserEmail,
    required this.receiverUserID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Uint8List? _file;
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage(String uid, String pseudo) async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
        widget.receiverUserID,
        _messageController.text,
        pseudo,
      );
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              // Add the user's profile image here
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1566210006746-4363a0f45280?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80',
              ),
            ),
            SizedBox(width: 10),
            Text(widget.receiverUserEmail),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.video_call),
            onPressed: () {
              // Implement video call functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {
              // Implement voice call functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildMessageInput(userProvider),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
        widget.receiverUserID,
        _firebaseAuth.currentUser!.uid,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return _buildMessageItem(snapshot.data!.docs[index]);
          },
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var isSender = (data['senderId'] == _firebaseAuth.currentUser!.uid);
    var bubbleColor = isSender ? Colors.blue : Colors.grey[300];

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
        isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSender)
            CircleAvatar(
              // Add sender's profile image here
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1566210006746-4363a0f45280?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80',
              ),
            ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              data['message'],
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput(UserProvider userProvider) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),

          IconButton(
            onPressed: () =>
                sendMessage(
                  userProvider.getUser.uid,
                  userProvider.getUser.pseudo,
                ),
            icon: Icon(
              Icons.send_rounded,
              size: 30,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}