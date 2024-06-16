// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Orderdetails extends StatefulWidget {
//   const Orderdetails({super.key});
//
//   @override
//   State<Orderdetails> createState() => _OrderdetailsState();
// }
//
// class _OrderdetailsState extends State<Orderdetails> {
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   var ID;
//   Future<void> getData() async {
//     SharedPreferences spref = await SharedPreferences.getInstance();
//     setState(() {
//       ID = spref.getString("id");
//       print(ID.toString());
//     });
//     print('data updated');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.black,
//         title: Text(
//           " YOUR ORDER LIST",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.black,
//       body: FutureBuilder(
//         future: FirebaseFirestore.instance
//             .collection("USER_SELL")
//             .where("Buyingownerid", isEqualTo: ID)
//             .get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return LinearProgressIndicator(
//               color: Colors.red,
//             );
//           }
//           if (snapshot.hasError) {
//             return Center(
//               child: Text("Error:${snapshot.error}"),
//             );
//           }
//           final SELL = snapshot.data?.docs ?? [];
//           return ListView.builder(
//             itemCount: SELL.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 color: Colors.white10,
//                 child: const ListTile(
//                   subtitle: Column(
//                     children: [
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 120,
//                             child: Text(
//                               "SELL OWNER",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                           Text(": "),
//                           Text(
//                             "${SELL[index]["username"]}",
//                             style: TextStyle(color: Colors.white),
//                           )
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 120,
//                             child: Text(
//                               "BUY AMOUNT",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                           Text(": "),
//                           Text(
//                             "1200 RS",
//                             style: TextStyle(color: Colors.red),
//                           )
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 120,
//                             child: Text(
//                               "QUANTITY",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                           Text(": "),
//                           Text(
//                             "1 gram",
//                             style: TextStyle(color: Colors.green),
//                           )
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Icon(
//                             Icons.done_all,
//                             color: Colors.green,
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Orderdetails extends StatefulWidget {
  const Orderdetails({super.key});

  @override
  State<Orderdetails> createState() => _OrderdetailsState();
}

class _OrderdetailsState extends State<Orderdetails> {
  var ID;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id");
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
          "YOUR ORDER LIST",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("USER_SELL")
            .where("Buyingownerid", isEqualTo: ID)
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
