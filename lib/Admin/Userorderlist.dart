import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userordersell extends StatefulWidget {
  const Userordersell({super.key});

  @override
  State<Userordersell> createState() => _UserordersellState();
}

class _UserordersellState extends State<Userordersell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("USER_SELL").get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator(
              color: Colors.red,
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }
          final SELL = snapshot.data?.docs ?? [];
          if (SELL.isEmpty) {
            return Center(
              child: Text(
                "No orders found",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return ListView.builder(
            itemCount: SELL.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white10,
                child: ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              "SELL OWNER",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Text(": "),
                          Text(
                            "${SELL[index]["username"]}",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              "BUY AMOUNT",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Text(": "),
                          Text(
                            "${SELL[index]["amount"]} RS",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              "QUANTITY",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Text(": "),
                          Text(
                            "${SELL[index]["gram"]} gram",
                            style: TextStyle(color: Colors.green),
                          )
                        ],
                      ),
                      SELL[index]["status"] == "1"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.done_all,
                                  color: Colors.green,
                                )
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Pending",
                                  style: TextStyle(color: Colors.red),
                                )
                              ],
                            )
                    ],
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
