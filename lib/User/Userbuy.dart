import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Userbuy extends StatefulWidget {
  const Userbuy({super.key});

  @override
  State<Userbuy> createState() => _UserbuyState();
}

class _UserbuyState extends State<Userbuy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            enableFeedback: true,
            leading: CircleAvatar(),
            title: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "JEW Name",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Data",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                )
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discount amount",
                  style: TextStyle(color: Colors.amber),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 80,
                    child: Center(
                      child: Text(
                        "BUY",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
