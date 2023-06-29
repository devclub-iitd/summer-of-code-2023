import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/utilites/routes.dart';
// ignore: unused_import
import 'package:myproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: context.canvasColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color:Colors.white),
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Rohit Raj"),
                accountEmail: Text("rohitraj@gmail.com"),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                  "assets/images/login_image.png",
                )),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoute.homeRoute);
              },
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email me",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.search,
                color: Colors.white,
              ),
              title:"Search".text.bold.white.make(),
            ),
            const SizedBox(
              height: 270,
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.device_desktop,
                color: Colors.white,
              ),
              title: const Text(
                "Log out",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: (() {
                Navigator.pushNamed(context, MyRoute.loginRoute);
              }),
            )
          ],
        ),
      ),
    );
  }
}
