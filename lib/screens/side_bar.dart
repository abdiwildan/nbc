import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('William A'),
            accountEmail: const Text('WilliamAA'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('assets/icons/avatar1.png')),
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box_rounded),
            title: Text("Profile"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/edit");
            },
          ),
          
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About Us"),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () {
              Navigator.popAndPushNamed(context, '/');
            },
          )
          
        ],
      ),
    );
  }
}
