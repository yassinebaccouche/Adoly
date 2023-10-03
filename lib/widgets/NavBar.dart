import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
class NavBar extends StatefulWidget {

  const NavBar({Key? key }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName:  Text(userProvider.getUser.pseudo),
              accountEmail:  Text(userProvider.getUser.email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  userProvider.getUser.photoUrl,
                  fit: BoxFit.cover, // You can adjust the BoxFit to your preference
                  width: double.infinity, // Set the width to cover the entire CircleAvatar
                  height: double.infinity, // Set the height to cover the entire CircleAvatar
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage('https://plus.unsplash.com/premium_photo-1668487827037-7b88850dea9c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmFja2dyb3VuZCUyMG1lZGljYWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60'),
              fit: BoxFit.cover,
              )

            ),


          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Find Friends'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
            onTap: (){},
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: (){},
          ),

          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: (){

            },
          ),
        ],
      ),

    );
  }
}
