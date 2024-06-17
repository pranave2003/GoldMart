// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo/User/UserLogin.dart';
// import 'package:demo/User/UserRegister.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Userprofile extends StatefulWidget {
//   const Userprofile({
//     super.key,
//   });
//
//   @override
//   State<Userprofile> createState() => _UserprofileState();
// }
//
// class _UserprofileState extends State<Userprofile> {
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   var Userid;
//   Future<void> getData() async {
//     SharedPreferences spref = await SharedPreferences.getInstance();
//     setState(() {
//       Userid = spref.getString("userid");
//       print("Userid=${Userid.toString()}");
//     });
//     print('data updated');
//   }
//
//   GETFILE() async {
//     user = await FirebaseFirestore.instance
//         .collection('UserReg')
//         .doc(Userid)
//         .get();
//   }
//
//   DocumentSnapshot? user;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: FutureBuilder(
//             future: GETFILE(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasError) {
//                 return Text("Error:${snapshot.error}");
//               }
//               return Scaffold(
//                 backgroundColor: Colors.black,
//                 body: Column(
//                   children: [
//                     Container(
//                       height: 165,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(1),
//                             bottomRight: Radius.circular(20)),
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           colors: [
//                             Color.fromRGBO(183, 153, 30, 1.0),
//                             Color.fromRGBO(246, 130, 45, 1.0),
//                           ],
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 300),
//                             child: ClipOval(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(30),
//                                 child: Image.asset(
//                                   "assets/profile.png",
//                                   height: 40,
//                                   width: 40,
//                                   fit: BoxFit.contain,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "TOTAL AMOUNT :${user!["AMOUNT"]}",
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.w900),
//                               )
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "BALANCE GOLD :${user!["GOLD"]}gram",
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.w900),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * .02,
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * .04,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Name :",
//                                   style: TextStyle(color: Colors.grey),
//                                 ),
//                                 SizedBox(
//                                   width:
//                                       MediaQuery.of(context).size.width * .04,
//                                 ),
//                                 Text(
//                                   user!["User Name"],
//                                   style: TextStyle(color: Colors.grey),
//                                 ),
//                               ],
//                             ),
//                             Divider(
//                               color: Colors.grey,
//                               endIndent: 20,
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * .01,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Gender :",
//                                   style: TextStyle(color: Colors.grey),
//                                 ),
//                                 SizedBox(
//                                   width:
//                                       MediaQuery.of(context).size.width * .04,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(),
//                                   child: Text(
//                                     user!["Gender"],
//                                     style: TextStyle(color: Colors.grey),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Divider(
//                               color: Colors.grey,
//                               endIndent: 20,
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * .01,
//                             ),
//                             TextButton(
//                               onPressed: () {},
//                               child: Text(
//                                 "Account Details",
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * .01,
//                             ),
//                             Divider(
//                               endIndent: 20,
//                             ),
//                             TextButton(
//                               onPressed: () {},
//                               child: Text(
//                                 "settings",
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ),
//                             Divider(
//                               endIndent: 20,
//                             ),
//                             TextButton(
//                               onPressed: () {},
//                               child: Text(
//                                 "Help & Support",
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.01,
//                             ),
//                             Divider(
//                               endIndent: 20,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 25),
//                               child: InkWell(
//                                 onTap: () {
//                                   Navigator.pushReplacement(context,
//                                       MaterialPageRoute(
//                                     builder: (context) {
//                                       return Userlogin();
//                                     },
//                                   ));
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 80),
//                                   child: Container(
//                                     height: 40,
//                                     width: 150,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(30),
//                                       color: Colors.white,
//                                     ),
//                                     child: Center(
//                                       child: Text("Logout",
//                                           style: GoogleFonts.ubuntu(
//                                               color: Colors.black,
//                                               fontSize: 10)),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/User/UserLogin.dart';
import 'package:demo/User/UserRegister.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({
    super.key,
  });

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  var Userid;
  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      Userid = spref.getString("userid");
      print("Userid=${Userid.toString()}");
    });
    print('data updated');
  }

  Stream<DocumentSnapshot> getUserStream() {
    return FirebaseFirestore.instance
        .collection('UserReg')
        .doc(Userid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<DocumentSnapshot>(
        stream: getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Text("User data not found.");
          }

          var user = snapshot.data!.data() as Map<String, dynamic>;

          return Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/gold.jpg"), fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(1),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/cash.jpg"),
                              ),
                            ),
                            Text(
                              "Rs : ${user!["AMOUNT"]}",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.amber,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/coin.jpg"),
                              ),
                            ),
                            Text(
                              "${user!["GOLD"]} Gram",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.amber,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Row(
                          children: [
                            Text(
                              "Name :",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .04,
                            ),
                            Text(
                              user["User Name"],
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                          endIndent: 20,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Row(
                          children: [
                            Text(
                              "Gender :",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .04,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Text(
                                user["Gender"],
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                          endIndent: 20,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Account Details",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Divider(
                          endIndent: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Settings",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Divider(
                          endIndent: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Help & Support",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Divider(
                          endIndent: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return Userlogin();
                                },
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 80),
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text("Logout",
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.black, fontSize: 10)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
