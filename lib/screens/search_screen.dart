import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:adol/screens/profile_screen.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;
  @override
  void dispose(){
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Form(
          child: TextFormField(
            controller: searchController,
            decoration: const InputDecoration(labelText: 'Search for a user...'),
            onFieldSubmitted: (String _) {
              setState(() {
                isShowUsers = true;
              });
             print(searchController.text);
            },
          ),
        ),
      ),
     body: isShowUsers ? FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
        .collection('users')
        .where('pseudo', isEqualTo: searchController.text)
        .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error.toString()}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('No users found.'),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final doc = snapshot.data!.docs[index];
              final data = doc.data();

              // Check if 'pseudo' and 'photoUrl' fields exist in the document
              final pseudo = data['pseudo'] ?? 'N/A';
              final photoUrl = data['photoUrl'] ?? ''; // Provide a default value or handle the absence

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(photoUrl),
                ),
                title: Text(pseudo),
              );
            },
          );
        }
      },
    ) : FutureBuilder(
    future: FirebaseFirestore.instance
        .collection('posts')
        .orderBy('datePublished')
        .get(),
    builder: (context, snapshot) {
    if (!snapshot.hasData) {
    return const Center(
    child: CircularProgressIndicator(),
    );
    }
    return MasonryGridView.count(
    crossAxisCount: 3,
    itemCount: (snapshot.data! as dynamic).docs.length,
    itemBuilder: (context, index) => Image.network(
    (snapshot.data! as dynamic).docs[index]['postUrl'],
    fit: BoxFit.cover,
    ),
    mainAxisSpacing: 8.0,
    crossAxisSpacing: 8.0,
    );



    },
    ),


    );
  }
}
