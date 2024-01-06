import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/authentication_repository.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthenticationRepository>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('William A'),
            accountEmail: Obx(() {
              final user = auth.currentUser;
              return Text(user?.displayName ?? 'Nama Pengguna Tidak Diset');
            }),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('assets/icons/avatar1.png')),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_box_rounded),
            title: const Text("Profile"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/profile");
            },
          ),
          ListTile(
            leading: const Icon(Icons.category_rounded),
            title: const Text("Kategori"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/category");
            },
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.settings_rounded),
            title: Text("Settings"),
          ),
          const ListTile(
            leading: Icon(Icons.info_rounded),
            title: Text("About Us"),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_rounded),
            title: const Text("Logout"),
            onTap: () async {
              await Get.find<AuthenticationRepository>().signOut();
            },
          )
        ],
      ),
    );
  }
}
