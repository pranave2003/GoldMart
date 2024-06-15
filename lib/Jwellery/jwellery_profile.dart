import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/Jwellery/jwellery_login.dart';
import 'package:demo/Jwellery/jwellery_register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JwelleryProfile extends StatefulWidget {
  const JwelleryProfile({super.key});

  @override
  State<JwelleryProfile> createState() => _JwelleryProfileState();
}

class _JwelleryProfileState extends State<JwelleryProfile> {
  void initState() {
    super.initState();
    getData();
  }

  var ID;
  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id");
      print(ID.toString());
    });
    print('data updated');
  }

  GETFILE() async {
    jwellery =
        await FirebaseFirestore.instance.collection('JewReg').doc(ID).get();
    print("object");
  }

  DocumentSnapshot? jwellery;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GETFILE(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error:${snapshot.error}");
        }
        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Container(
                height: 165,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(1),
                      bottomRight: Radius.circular(100)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(183, 153, 30, 1.0),
                      Color.fromRGBO(246, 130, 45, 1.0),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 60),
                      child: jwellery!["path"] == null
                          ? Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/gold.jpg"),
                                  radius: 40,
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(jwellery!["path"]),
                                  radius: 40,
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
                          SizedBox(
                            width: 150,
                            child: Text(
                              "NAME ",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .04,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              jwellery!["Jwellery Name"],
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
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              "GST :",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .04,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              jwellery!["GST Number"],
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
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              "PHONE ",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .04,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              jwellery!["Phone Number"],
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Divider(
                        endIndent: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              "EMAIL ",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .04,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              jwellery!["Mail"],
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        endIndent: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              "Licence Number",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .04,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              jwellery!["Licence Number"],
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JwelleryLogin()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 80, top: 100),
                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber,
                              ),
                              child: Center(
                                child: Text("Logout",
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.black, fontSize: 20)),
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
    );
  }
}
