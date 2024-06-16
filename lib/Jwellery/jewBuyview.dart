// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // class Jewbuyview extends StatefulWidget {
// //   const Jewbuyview({super.key, required this.usersellid});
// //   final usersellid;
// //
// //   @override
// //   State<Jewbuyview> createState() => _JewbuyviewState();
// // }
// //
// // class _JewbuyviewState extends State<Jewbuyview> {
// //   void initState() {
// //     super.initState();
// //     getData();
// //   }
// //
// //   var ID;
// //   Future<void> getData() async {
// //     SharedPreferences spref = await SharedPreferences.getInstance();
// //     setState(() {
// //       ID = spref.getString("id");
// //       print(ID.toString());
// //     });
// //     print('data updated');
// //   }
// //
// //   GETFILE() async {
// //     Usersell = await FirebaseFirestore.instance
// //         .collection('USER_SELL')
// //         .doc(widget.usersellid)
// //         .get();
// //     print("object");
// //   }
// //
// //   GETREG() async {
// //     JewREG =
// //         await FirebaseFirestore.instance.collection('JewReg').doc(ID).get();
// //     print("object");
// //   }
// //
// //   GETUSER() async {
// //     USERREG = await FirebaseFirestore.instance
// //         .collection('UserReg')
// //         .doc(Usersell!["userid"])
// //         .get();
// //     print("object");
// //   }
// //
// //   DocumentSnapshot? Usersell;
// //   DocumentSnapshot? USERREG;
// //   DocumentSnapshot? JewREG;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       appBar: AppBar(
// //         backgroundColor: Colors.black,
// //       ),
// //       body: Column(
// //         children: [
// //           FutureBuilder(
// //             future: GETFILE(),
// //             builder: (context, snapshot) {
// //               if (snapshot.connectionState == ConnectionState.waiting) {
// //                 return Center(child: CircularProgressIndicator());
// //               }
// //               if (snapshot.hasError) {
// //                 return Text("Error:${snapshot.error}");
// //               }
// //               return Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Container(
// //                         height: 150,
// //                         width: 350,
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: Row(
// //                                 children: [
// //                                   SizedBox(
// //                                       width: 100,
// //                                       child: Text(
// //                                         "NAME",
// //                                         style: TextStyle(fontSize: 20),
// //                                       )),
// //                                   Text(":"),
// //                                   Text(
// //                                     Usersell!["username"],
// //                                     style: TextStyle(fontSize: 20),
// //                                   )
// //                                 ],
// //                               ),
// //                             ),
// //                             Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: Row(
// //                                 children: [
// //                                   SizedBox(
// //                                       width: 100,
// //                                       child: Text(
// //                                         "GRAM",
// //                                         style: TextStyle(fontSize: 20),
// //                                       )),
// //                                   Text(":"),
// //                                   Text(
// //                                     Usersell!["gram"],
// //                                     style: TextStyle(fontSize: 20),
// //                                   )
// //                                 ],
// //                               ),
// //                             ),
// //                             Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: Row(
// //                                 children: [
// //                                   SizedBox(
// //                                       width: 100,
// //                                       child: Text(
// //                                         "AMOUNT",
// //                                         style: TextStyle(fontSize: 20),
// //                                       )),
// //                                   Text(":"),
// //                                   Text(
// //                                     "RS:${Usersell!["amount"]}",
// //                                     style: TextStyle(
// //                                         color: Colors.green, fontSize: 25),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         decoration: BoxDecoration(
// //                             color: Colors.white30,
// //                             borderRadius: BorderRadius.circular(10)),
// //                       ),
// //                     ],
// //                   ),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       FutureBuilder(
// //                           future: GETREG(),
// //                           builder: (context, snapshot) {
// //                             if (snapshot.connectionState ==
// //                                 ConnectionState.waiting) {
// //                               return Center(child: CircularProgressIndicator());
// //                             }
// //                             if (snapshot.hasError) {
// //                               return Text("Error:${snapshot.error}");
// //                             }
// //                             return Container(
// //                               height: 200,
// //                               width: 350,
// //                               child: Column(
// //                                 mainAxisAlignment: MainAxisAlignment.center,
// //                                 children: [
// //                                   Padding(
// //                                     padding: const EdgeInsets.all(8.0),
// //                                     child: Row(
// //                                       children: [
// //                                         SizedBox(
// //                                             width: 100,
// //                                             child: Text(
// //                                               "OWNER",
// //                                               style: TextStyle(fontSize: 20),
// //                                             )),
// //                                         Text(":"),
// //                                         Text(
// //                                           JewREG!["Owner Name"],
// //                                           style: TextStyle(fontSize: 20),
// //                                         )
// //                                       ],
// //                                     ),
// //                                   ),
// //                                   Padding(
// //                                     padding: const EdgeInsets.all(8.0),
// //                                     child: Row(
// //                                       children: [
// //                                         SizedBox(
// //                                             width: 200,
// //                                             child: Text(
// //                                               "Balance goldGRAM",
// //                                               style: TextStyle(fontSize: 20),
// //                                             )),
// //                                         Text(":"),
// //                                         Text(
// //                                           JewREG!["GOLD"],
// //                                           style: TextStyle(fontSize: 20),
// //                                         )
// //                                       ],
// //                                     ),
// //                                   ),
// //                                   Padding(
// //                                     padding: const EdgeInsets.all(8.0),
// //                                     child: Row(
// //                                       children: [
// //                                         SizedBox(
// //                                             width: 200,
// //                                             child: Text(
// //                                               "BALANCE AMOUNT",
// //                                               style: TextStyle(fontSize: 20),
// //                                             )),
// //                                         Text(":"),
// //                                         Text(
// //                                           "RS:${JewREG!["AMOUNT"]}",
// //                                           style: TextStyle(
// //                                               color: Colors.green,
// //                                               fontSize: 25),
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   ),
// //                                   FutureBuilder(
// //                                     future: GETUSER(),
// //                                     builder: (context, snapshot) {
// //                                       if (snapshot.connectionState ==
// //                                           ConnectionState.waiting) {
// //                                         return Center(
// //                                             child: CircularProgressIndicator());
// //                                       }
// //                                       if (snapshot.hasError) {
// //                                         return Text("Error:${snapshot.error}");
// //                                       }
// //                                       return Row(
// //                                         children: [
// //                                           SizedBox(
// //                                               width: 200,
// //                                               child: Text(
// //                                                 "BALANCE AMOUNT",
// //                                                 style: TextStyle(fontSize: 20),
// //                                               )),
// //                                           Text(":"),
// //                                           Text(
// //                                             USERREG!["User Name"],
// //                                             style: TextStyle(
// //                                                 color: Colors.red,
// //                                                 fontSize: 25),
// //                                           ),
// //                                         ],
// //                                       );
// //                                     },
// //                                   ),
// //                                 ],
// //                               ),
// //                               decoration: BoxDecoration(
// //                                   color: Colors.white30,
// //                                   borderRadius: BorderRadius.circular(10)),
// //                             );
// //                           }),
// //                     ],
// //                   ),
// //                   Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: InkWell(
// //                       onTap: () {
// //                         int jewllerybalance = int.parse(JewREG!["AMOUNT"]);
// //                         int usersellamount = int.parse(Usersell!["amount"]);
// //                         int usersellgold = int.parse(
// //                           Usersell!["gram"],
// //                         );
// //                         int userbalanceamount = int.parse(USERREG!["AMOUNT"]);
// //
// //                         int jewllerytotalgold = int.parse(JewREG!["GOLD"]);
// //
// //                         var afterbuyjetsidebalanse =
// //                             jewllerybalance - usersellamount;
// //                         var afterbuyjetsidegold =
// //                             usersellgold + jewllerytotalgold;
// //                         var afteruseramount =
// //                             userbalanceamount + usersellamount;
// //                         if (jewllerybalance > usersellamount) {
// //                           FirebaseFirestore.instance
// //                               .collection("JewReg")
// //                               .doc(ID)
// //                               .update({
// //                             "AMOUNT": afterbuyjetsidebalanse.toString(),
// //                             "GOLD": afterbuyjetsidegold.toString()
// //                           });
// //                           FirebaseFirestore.instance
// //                               .collection("USER_SELL")
// //                               .doc(Usersell?.id)
// //                               .update({"status": "1", "Buyingownerid": ID});
// //                           FirebaseFirestore.instance
// //                               .collection("UserReg")
// //                               .doc(USERREG?.id)
// //                               .update({"AMOUNT": afteruseramount.toString()});
// //                           Navigator.of(context).pop();
// //                         } else {
// //                           ScaffoldMessenger.of(context)
// //                               .showSnackBar(const SnackBar(
// //                                   content: Text(
// //                             "invalid amount Please purchase ",
// //                             style: TextStyle(color: Colors.red),
// //                           )));
// //                         }
// //                       },
// //                       child: Container(
// //                         height: 50,
// //                         width: 150,
// //                         child: Center(
// //                           child: Text(
// //                             "BUY",
// //                             style: TextStyle(
// //                                 color: Colors.black,
// //                                 fontWeight: FontWeight.bold,
// //                                 fontSize: 20),
// //                           ),
// //                         ),
// //                         decoration: BoxDecoration(
// //                           color: Colors.green.shade100,
// //                           borderRadius: BorderRadius.circular(10),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Jewbuyview extends StatefulWidget {
//   const Jewbuyview({super.key, required this.usersellid});
//   final String usersellid;
//
//   @override
//   State<Jewbuyview> createState() => _JewbuyviewState();
// }
//
// class _JewbuyviewState extends State<Jewbuyview> {
//   String? ID;
//   DocumentSnapshot? Usersell;
//   DocumentSnapshot? USERREG;
//   DocumentSnapshot? JewREG;
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   Future<void> getData() async {
//     SharedPreferences spref = await SharedPreferences.getInstance();
//     ID = spref.getString("id");
//     if (ID != null) {
//       await Future.wait([GETFILE(), GETREG(), GETUSER()]);
//       setState(() {});
//     }
//   }
//
//   Future<void> GETFILE() async {
//     Usersell = await FirebaseFirestore.instance
//         .collection('USER_SELL')
//         .doc(widget.usersellid)
//         .get();
//   }
//
//   Future<void> GETREG() async {
//     JewREG =
//         await FirebaseFirestore.instance.collection('JewReg').doc(ID).get();
//   }
//
//   Future<void> GETUSER() async {
//     USERREG = await FirebaseFirestore.instance
//         .collection('UserReg')
//         .doc(Usersell!["userid"])
//         .get();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (Usersell == null || USERREG == null || JewREG == null) {
//       return Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//         ),
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.all(10),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.white30,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   children: [
//                     detailRow("SELLER NAME", Usersell!["username"]),
//                     detailRow("GRAM", Usersell!["gram"]),
//                     detailRow("AMOUNT", "RS:${Usersell!["amount"]}",
//                         isAmount: true),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(10),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.white30,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   children: [
//                     detailRow("OWNER", JewREG!["Owner Name"]),
//                     detailRow("BALANCE GOLD GRAM", JewREG!["GOLD"]),
//                     detailRow("YOUR BALANCE ", "RS:${JewREG!["AMOUNT"]}",
//                         isAmount: true),
//                     detailRow("USER NAME", USERREG!["User Name"]),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: InkWell(
//                   onTap: () {
//                     handleBuy();
//                   },
//                   child: Container(
//                     height: 50,
//                     width: 150,
//                     decoration: BoxDecoration(
//                       color: Colors.green.shade100,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "BUY",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget detailRow(String label, String value, {bool isAmount = false}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 200,
//             child: Text(
//               label,
//               style: TextStyle(fontSize: 20, color: Colors.white),
//             ),
//           ),
//           Text(
//             ": ",
//             style: TextStyle(fontSize: 20, color: Colors.white),
//           ),
//           Expanded(
//             child: Text(
//               value,
//               style: TextStyle(
//                 fontSize: isAmount ? 25 : 20,
//                 color: isAmount ? Colors.green : Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void handleBuy() {
//     int jewllerybalance = int.parse(JewREG!["AMOUNT"]);
//     int usersellamount = int.parse(Usersell!["amount"]);
//     int usersellgold = int.parse(Usersell!["gram"]);
//     int userbalanceamount = int.parse(USERREG!["AMOUNT"]);
//     int jewllerytotalgold = int.parse(JewREG!["GOLD"]);
//
//     var afterbuyjetsidebalanse = jewllerybalance - usersellamount;
//     var afterbuyjetsidegold = usersellgold + jewllerytotalgold;
//     var afteruseramount = userbalanceamount + usersellamount;
//
//     if (jewllerybalance > usersellamount) {
//       FirebaseFirestore.instance.collection("JewReg").doc(ID).update({
//         "AMOUNT": afterbuyjetsidebalanse.toString(),
//         "GOLD": afterbuyjetsidegold.toString()
//       });
//       FirebaseFirestore.instance
//           .collection("USER_SELL")
//           .doc(Usersell?.id)
//           .update({"status": "1", "Buyingownerid": ID});
//       FirebaseFirestore.instance
//           .collection("UserReg")
//           .doc(USERREG?.id)
//           .update({"AMOUNT": afteruseramount.toString()});
//       Navigator.of(context).pop();
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text(
//           "Invalid amount. Please check and try again.",
//           style: TextStyle(color: Colors.red),
//         ),
//       ));
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Jewbuyview extends StatefulWidget {
  const Jewbuyview({super.key, required this.usersellid});
  final String usersellid;

  @override
  State<Jewbuyview> createState() => _JewbuyviewState();
}

class _JewbuyviewState extends State<Jewbuyview> {
  String? ID;
  DocumentSnapshot? Usersell;
  DocumentSnapshot? USERREG;
  DocumentSnapshot? JewREG;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    ID = spref.getString("id");
  }

  Future<void> fetchAllData() async {
    await getData();
    if (ID != null) {
      Usersell = await FirebaseFirestore.instance
          .collection('USER_SELL')
          .doc(widget.usersellid)
          .get();
      if (Usersell != null) {
        USERREG = await FirebaseFirestore.instance
            .collection('UserReg')
            .doc(Usersell!["userid"])
            .get();
      }
      JewREG =
          await FirebaseFirestore.instance.collection('JewReg').doc(ID).get();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchAllData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: Center(child: Text("Error: ${snapshot.error}")),
          );
        }

        if (Usersell == null || USERREG == null || JewREG == null) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: Center(child: Text("No data available")),
          );
        }

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        detailRow("NAME", Usersell!["username"]),
                        detailRow("GRAM", Usersell!["gram"]),
                        detailRow("AMOUNT", "RS:${Usersell!["amount"]}",
                            isAmount: true),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        detailRow("OWNER", JewREG!["Owner Name"]),
                        detailRow("BALANCE GOLD GRAM", JewREG!["GOLD"]),
                        detailRow("BALANCE AMOUNT", "RS:${JewREG!["AMOUNT"]}",
                            isAmount: true),
                        detailRow("USER NAME", USERREG!["User Name"]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        handleBuy();
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "BUY",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget detailRow(String label, String value, {bool isAmount = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: Text(
              label,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Text(
            ": ",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: isAmount ? 25 : 20,
                color: isAmount ? Colors.green : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleBuy() {
    int jewllerybalance = int.parse(JewREG!["AMOUNT"]);
    int usersellamount = int.parse(Usersell!["amount"]);
    int usersellgold = int.parse(Usersell!["gram"]);
    int userbalanceamount = int.parse(USERREG!["AMOUNT"]);
    int jewllerytotalgold = int.parse(JewREG!["GOLD"]);

    var afterbuyjetsidebalanse = jewllerybalance - usersellamount;
    var afterbuyjetsidegold = usersellgold + jewllerytotalgold;
    var afteruseramount = userbalanceamount + usersellamount;

    if (jewllerybalance > usersellamount) {
      FirebaseFirestore.instance.collection("JewReg").doc(ID).update({
        "AMOUNT": afterbuyjetsidebalanse.toString(),
        "GOLD": afterbuyjetsidegold.toString()
      });
      FirebaseFirestore.instance
          .collection("USER_SELL")
          .doc(Usersell?.id)
          .update({"status": "1", "Buyingownerid": ID});
      FirebaseFirestore.instance
          .collection("UserReg")
          .doc(USERREG?.id)
          .update({"AMOUNT": afteruseramount.toString()});
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Invalid amount. Please check and try again.",
          style: TextStyle(color: Colors.red),
        ),
      ));
    }
  }
}
