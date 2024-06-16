import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/User/Userbuyview.dart';
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
            .collection('Jewllery_SELL')
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
          return ListView.builder(
            itemCount: jewsell.length,
            itemBuilder: (context, index) {
              return ListTile(
                enableFeedback: true,
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/usercoin.jpg"),
                ),
                title: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          jewsell[index]["Jewlleryname"],
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "1 gram",
                          style: TextStyle(color: Colors.green),
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
                      style: TextStyle(color: Colors.red, fontSize: 25),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Userbuyview(jewbuyid: jewsell[index].id),
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
              );
            },
          );
        },
      ),
    );
  }
}
