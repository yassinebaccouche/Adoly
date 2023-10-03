import 'dart:typed_data';

import 'package:adol/widgets/storys_card.dart'; // Import your StoryApp widget
import 'package:adol/widgets/post_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/post.dart';
import '../providers/user_provider.dart';
import '../resources/firestore_methods.dart';
import '../utils/utils.dart';

class FeedScreen extends StatefulWidget {

  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Uint8List? _file;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Take a photo'),
              onPressed: () async {
                Navigator.pop(context);
                Uint8List file = await pickImage(ImageSource.camera);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Choose from Gallery'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.gallery);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(

      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 117, // Set the height as needed
                child: SizedBox.expand(child: StoryApp()),
                // Wrap StoryApp in SizedBox.expand
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: [
                    ListTile(
                      leading:  CircleAvatar(
                        backgroundImage: NetworkImage( userProvider.getUser.photoUrl,),
                      ),
                      title: TextField(
                        decoration: InputDecoration(
                          hintText: "What's on your mind?",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 15.0,
                      width: 15.0,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              alignment: FractionalOffset.topCenter,
                              image: _file != null
                                  ? MemoryImage(_file!) as ImageProvider<Object>
                                  : AssetImage('assets/logo.png'), // Replace 'your_placeholder_image_path' with your actual placeholder image path
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            _selectImage(context);
                            // Add functionality for attaching photos
                          },
                          icon: Icon(
                            Icons.photo,
                            color: Colors.green,
                          ),
                          label: Text(
                            "Photo",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // Add functionality for tagging friends
                          },
                          icon: Icon(
                            Icons.tag_faces,
                            color: Colors.purple,
                          ),
                          label: Text(
                            "Tag Friends",
                            style: TextStyle(color: Colors.purple),
                          ),
                        ),
                        TextButton(
                          onPressed: () => postImage(
                            userProvider.getUser.uid,
                            userProvider.getUser.pseudo,
                            userProvider.getUser.photoUrl,
                          ),
                          child: const Text(
                            'Post',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // Divider line
              Divider(
                height: 0, // Remove default divider padding
                thickness: 1,
                color: Colors.grey[300],
              ),

              Expanded(

                child: StreamBuilder(

                  stream: FirebaseFirestore.instance.collection('posts').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }


                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (ctx, index) => PostCard(
                        snap: snapshot.data!.docs[index].data(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void postImage(String uid, String pseudo, String profImage) async {
    setState(() {
      isLoading = true;
    });

    // start the loading
    try {
      // upload to storage and db
      String res = await FireStoreMethods().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        pseudo,
        profImage,
      );

      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        if (context.mounted) {
          showSnackBar(
            context,
            'Published!',
          );
        }
        clearImage();
      } else {
        if (context.mounted) {
          showSnackBar(context, res);
        }
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

}

