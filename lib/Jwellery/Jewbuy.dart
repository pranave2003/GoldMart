import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'jewBuyview.dart';

class Jewbuy extends StatefulWidget {
  const Jewbuy({super.key});

  @override
  State<Jewbuy> createState() => _JewbuyState();
}

class _JewbuyState extends State<Jewbuy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BUY THE GOLD",
          style: TextStyle(color: Colors.blue.shade100),
        ),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('USER_SELL')
            .where("status", isEqualTo: "0")
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final jewsell = snapshot.data?.docs ?? [];
          if (jewsell.isEmpty) {
            return Center(
              child: Text(
                "NO DATA FOUND",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }
          return ListView.builder(
            itemCount: jewsell.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  color: Colors.white10,
                  child: ListTile(
                    enableFeedback: true,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/coin.jpg"),
                    ),
                    title: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              jewsell[index]["username"],
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "${jewsell[index]["gram"]}gram",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "RS:${jewsell[index]["amount"]}",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Jewbuyview(
                                    usersellid: jewsell[index].id);
                              },
                            ));
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            child: Center(
                              child: Text(
                                "BUY",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
