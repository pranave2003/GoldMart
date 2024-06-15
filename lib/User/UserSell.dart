import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Customfield/my_Textfield.dart';

class UserSell extends StatefulWidget {
  const UserSell({super.key});

  @override
  State<UserSell> createState() => _UserSellState();
}

class _UserSellState extends State<UserSell> {

  final formkey = GlobalKey<FormState>();
  var amountrl = TextEditingController();
  bool isloading = false;
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

  GETFILE() async {
    user = await FirebaseFirestore.instance
        .collection('UserReg')
        .doc(Userid)
        .get();
  }

  DocumentSnapshot? user;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: GETFILE(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text("Error:${snapshot.error}");
                  }
                  return Container(
                    height: 250,
                    width: 350,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: Text(
                                    "NAME",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Text(":"),
                              Text(
                                user!["User Name"],
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: Text(
                                    "AMOUNT",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Text(":"),
                              Text("RS."),
                              Text(
                                user!["AMOUNT"],
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Email",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Text(":"),
                              Text(
                                user!["Email"],
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),


                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  );
                },
              ),
              SizedBox(
                height: 200,
              ),
              MyTextFields(
                  controller: amountrl,
                  hintText: "EnterAmount",
                  obscureText: false,
                  validation: "Invalid Amount"),
              InkWell(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    int a = int.parse(user!["AMOUNT"]);
                    int b = int.parse(amountrl.text);
                    var c = a - b;
                    if (a > b) {
                      FirebaseFirestore.instance
                          .collection("USER_SELL")
                          .add({
                        "Amount": amountrl.text,
                        "Jewlleryname": user!["User Name"],
                        "jewlleryid": user?.id
                      });

                      print(c);
                      FirebaseFirestore.instance
                          .collection("JewReg")
                          .doc(Userid)
                          .update({"AMOUNT": c.toString()});
                      Navigator.of(context).pop();

                      print("Done");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                            "invalid amount Please purchase ",
                            style: TextStyle(color: Colors.red),
                          )));
                    }
                  }
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white60),
                  child: Center(
                    child: Text(
                      "SELL",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
