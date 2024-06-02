// import 'package:endproject1/utilities/constants.dart';
import 'package:endproject1/screens/compiler/web_view_stack.dart';
import 'package:endproject1/ui/home.dart';
// import 'package:endproject1/ui/ongoing_contest.dart';
// import 'package:endproject1/ui/previous_contest.dart';
import 'package:endproject1/ui/cf_login.dart';
import 'package:endproject1/virtual%20Space/virtualspace1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.blue,
      child: Container(
        // color: kPrimaryColor,
        // color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.cyanAccent,
              ),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                ),
                accountName: Text(
                  "Codifyk",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontFamily: GoogleFonts.mateSc().fontFamily),
                ),
                accountEmail: Text(
                  "",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontFamily: GoogleFonts.mateSc().fontFamily),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("assets/Bard_Generated_Image Background Removed.png"),
                ),
              ),
            ),
            ListTile(
              onTap: () {
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
              title: const Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SingleUserInputPage()),
            );
              },
              leading: const Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,
              ),
              title: const Text(
                "Search User",
                textScaleFactor: 1.2,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Virtualspace()),
                );
              },
              leading: const Icon(
                CupertinoIcons.sparkles,
                color: Colors.black,
              ),
              title: const Text(
                "Virtual Space",
                style: const TextStyle(color: Colors.black),
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WebViewStack()),
                );
              },
              leading: const Icon(
                CupertinoIcons.helm,
                color: Colors.black,
              ),
              title: const Text(
                "Compiler",
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
