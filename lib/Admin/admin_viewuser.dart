import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/Admin/admin_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminViewUser extends StatefulWidget {
  const AdminViewUser({super.key, required this.id});
  final id;
  @override
  State<AdminViewUser> createState() => _AdminViewUserState();
}

class _AdminViewUserState extends State<AdminViewUser> {
  GETDOC() async {
    acuser = await FirebaseFirestore.instance
        .collection('UserReg')
        .doc(widget.id)
        .get();
  }

  DocumentSnapshot? acuser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GETDOC(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Error:${snapshot.error}");
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 122,
              backgroundColor: Colors.amberAccent,
              shadowColor: Colors.grey,
              elevation: 2,
              shape: ContinuousRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(80)),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdminUser()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Edit",
                          style: GoogleFonts.inriaSerif(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .010,
                        ),
                        Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .060,
                ),
              ],
            ),
            backgroundColor: Colors.black,
            body: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .09,
                      width: MediaQuery.of(context).size.width * .15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .04,
                    ),
                    Text(
                      "User Name:",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      acuser!["User Name"],
                      style: TextStyle(color: Colors.grey),
                    ),
                    Divider(
                      color: Colors.grey,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Text(
                      "Age:",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      acuser!["Age"],
                      style: TextStyle(color: Colors.grey),
                    ),
                    Divider(
                      color: Colors.grey,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Text(
                      "Gender:",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      acuser!["Gender"],
                      style: TextStyle(color: Colors.grey),
                    ),
                    Divider(
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Text(
                      "valid Proof Id:",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      acuser!["vaild proof"],
                      style: TextStyle(color: Colors.grey),
                    ),
                    Divider(
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Text(
                      "Email:",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      acuser!["Email"],
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Divider(
                      endIndent: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
