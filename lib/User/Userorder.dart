import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userorder extends StatefulWidget {
  const Userorder({super.key});

  @override
  State<Userorder> createState() => _UserorderState();
}

class _UserorderState extends State<Userorder> {
  var ID;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("userid");
      print(ID.toString());
    });
    print('data updated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text(
          " YOUR ORDER LIST",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("Jewllery_SELL")
            .where("Buyinguserownerid", isEqualTo: ID)
            .where("status", isEqualTo: "1")
            .get(),
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
                child: const ListTile(
                  subtitle: Column(
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
                            "Name",
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
                            "1200 RS",
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
                            "1 gram",
                            style: TextStyle(color: Colors.green),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.done_all,
                            color: Colors.green,
                          )
                        ],
                      ),
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
