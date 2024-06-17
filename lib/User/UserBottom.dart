import 'package:demo/User/user_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'User_profile.dart';
import 'Userorder.dart';

class Userbottom extends StatefulWidget {
  const Userbottom({super.key});

  @override
  State<Userbottom> createState() => _UserbottomState();
}

class _UserbottomState extends State<Userbottom> {
  int currentindex = 0;
  final pages = [UserHome(), Userorder(), Userprofile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: currentindex,
        onTap: (newIndex) {
          setState(() {
            currentindex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
                color: Colors.amber,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.today,
                color: Colors.amber,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person_crop_circle_fill,
                color: Colors.amber,
              ),
              label: 'Profile'),
        ],
        selectedItemColor: Colors.blue.shade100,
        unselectedItemColor: Color.fromRGBO(143, 154, 163, 1),
        selectedLabelStyle: TextStyle(color: Color.fromRGBO(191, 68, 116, 1)),
      ),
    );
  }
}
