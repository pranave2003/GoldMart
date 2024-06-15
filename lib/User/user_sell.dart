import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSell extends StatefulWidget {
  const UserSell({super.key});

  @override
  State<UserSell> createState() => _UserSellState();
}

class _UserSellState extends State<UserSell> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        backgroundColor: Colors.black,
        body:Column(
        children: [
        SizedBox(height: 25,),
    TextFormField(
    decoration: InputDecoration(
    filled: true,
    suffixIcon: Icon(CupertinoIcons.search),
    fillColor: Color(0xFFD9D9D9),
    border: OutlineInputBorder(
    // gapPadding: 10,
    borderRadius: BorderRadius.circular(40)
    ),
    labelText: "Search",
    labelStyle:
    TextStyle(color: Color(0xFF747070)),
    ),
    ),
    ],
    ),

        ));
  }
}
