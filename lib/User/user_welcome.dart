import 'package:flutter/material.dart';

class UserWelcome extends StatefulWidget {
  const UserWelcome({super.key});

  @override
  State<UserWelcome> createState() => _UserWelcomeState();
}

class _UserWelcomeState extends State<UserWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Welcome.png'), fit: BoxFit.cover)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Congrats',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'You are all set to start your savings\n journey',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 56,
                  width: 308,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Go to Home'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(250, 205, 24, 1),
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
