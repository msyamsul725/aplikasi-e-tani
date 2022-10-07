import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Syamsul Maarif'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/image/sem.jpg'),
            ),
            accountEmail: Text("msyamsul725@gmail.com"),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          DrawerListTile(
            iconData: Icons.group,
            title: "NewGroup",
            onTilePressed: null,
          ),
          DrawerListTile(
            iconData: Icons.lock,
            title: "New Scret Group",
            onTilePressed: null,
          ),
          DrawerListTile(
            iconData: Icons.notifications,
            title: "New Chanel Chat",
          ),
          DrawerListTile(
            iconData: Icons.contacts,
            title: "Contacts",
            onTilePressed: null,
          ),
          DrawerListTile(
            iconData: Icons.bookmark_border,
            title: "Saved Messages",
            onTilePressed: null,
          ),
          DrawerListTile(
            iconData: Icons.phone,
            title: "calss",
            onTilePressed: null,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTile({
    // ignore: non_constant_identifier_names
    Key? Key,
    this.iconData,
    this.title,
    this.onTilePressed,
  }) : super(key: Key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title!,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
