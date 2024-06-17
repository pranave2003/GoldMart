import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/Jwellery/jwellery_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Payscreen.dart';

class JwelleryProfile extends StatefulWidget {
  const JwelleryProfile({super.key});

  @override
  State<JwelleryProfile> createState() => _JwelleryProfileState();
}

class _JwelleryProfileState extends State<JwelleryProfile> {
  String? ID;
  DocumentSnapshot? jwellery;
  var amountctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    ID = spref.getString("id");
    if (ID != null) {
      jwellery =
          await FirebaseFirestore.instance.collection('JewReg').doc(ID).get();
    }
  }

  void update() {
    print("insert");
    int currentamount = int.parse(jwellery!["AMOUNT"]);
    int enteramount = int.parse(amountctrl.text);
    var totalcurrentbalance = currentamount + enteramount;
    FirebaseFirestore.instance
        .collection("JewReg")
        .doc(ID)
        .update({"AMOUNT": totalcurrentbalance.toString()});
    print("update success");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: Text("Error: ${snapshot.error}")),
          );
        }

        if (ID == null || jwellery == null || !jwellery!.exists) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: Text("No data available")),
          );
        }

        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/gold.jpg")),
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
                            "${jwellery!["AMOUNT"]}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.amber,
                              fontWeight: FontWeight.w900,
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
                            "${jwellery!["GOLD"]} Gram",
                            style: TextStyle(
                              fontSize: 20,
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
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .02),
                    detailRow("NAME", jwellery!["Jwellery Name"]),
                    detailRow("GST", jwellery!["GST Number"]),
                    detailRow("PHONE", jwellery!["Phone Number"]),
                    detailRow("EMAIL", jwellery!["Mail"]),
                    detailRow("Licence Number", jwellery!["Licence Number"]),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.black,
                                title: Text(
                                  "Enter Amount",
                                  style: TextStyle(color: Colors.amber),
                                ),
                                content: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: amountctrl,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'empty file';
                                      }
                                    },
                                    style: TextStyle(),
                                    decoration: InputDecoration(
                                        filled: true,
                                        border: InputBorder.none,
                                        hintText: "Enter amount")),
                                actions: [
                                  Center(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white30),
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return UpiPaymentScreen(
                                                price: double.parse(
                                                    amountctrl.text),
                                              );
                                            },
                                          ));
                                          update();
                                        },
                                        child: Text(
                                          "PAY",
                                          style: TextStyle(color: Colors.amber),
                                        )),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber,
                              ),
                              child: Center(
                                child: Text(
                                  "ADD AMOUNT",
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.black,
                                    fontSize: 20,
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
              ),
            ],
          ),
        );
      },
    );
  }

  Widget detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Text(
              "$label :",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * .04),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
