import 'package:adol/screens/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UserDisplay extends StatefulWidget {
  const UserDisplay({Key? key}) : super(key: key);

  @override
  State<UserDisplay> createState() => _UserDisplayState();
}

class _UserDisplayState extends State<UserDisplay> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adol Messaging'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Implement direct messages here
            },
          ),
        ],
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _buildErrorWidget('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingWidget();
        }
        final userList = snapshot.data!.docs;
        return ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return _buildUserListItem(userList[index]);
          },
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final currentUserPseudo = _auth.currentUser?.displayName;
    final userPseudo = data['pseudo'];
    final userProfileImage = data['photoUrl'];

    if (currentUserPseudo != userPseudo) {
      return ListTile(
        leading: CircleAvatar(

          backgroundImage: userProfileImage != null
              ? NetworkImage(userProfileImage)
              : null,
          child: userProfileImage == null
              ? Icon(
            Icons.person,
            color: Colors.white,
          )
              : null,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(userPseudo ,style: TextStyle( fontFamily: 'Inter',),),
            Icon(
              Icons.check_circle,
              color: Colors.blue, // Customize the sent icon color
            ),
          ],
        ),
        subtitle: Text('Last message and timestamp'
        ), // Implement last message and timestamp
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserEmail: data['email'],
                receiverUserID: data['uid'],
              ),
            ),
          );
        },
      );
    }
    return Container(); // Hide current user from the list
  }

  Widget _buildErrorWidget(String message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.red,
          fontFamily: 'Inter',
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }
}
