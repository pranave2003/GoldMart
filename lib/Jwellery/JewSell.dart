import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/Customfield/my_Textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JewSell extends StatefulWidget {
  const JewSell({super.key});

  @override
  State<JewSell> createState() => _JewSellState();
}

class _JewSellState extends State<JewSell> {
  final formkey = GlobalKey<FormState>();
  var amountrl = TextEditingController();
  bool isloading = false;
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
                                jwellery!["Jwellery Name"],
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
                                jwellery!["AMOUNT"],
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
                                    "Phone Number",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Text(":"),
                              Text(
                                jwellery!["Phone Number"],
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
                                    "GST Number",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Text(":"),
                              Text(
                                jwellery!["GST Number"],
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
                                    "Licence Number",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Text(":"),
                              Text(
                                jwellery!["Licence Number"],
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
                    int a = int.parse(jwellery!["AMOUNT"]);
                    int b = int.parse(amountrl.text);
                    var c = a - b;
                    if (a > b) {
                      FirebaseFirestore.instance
                          .collection("Jewllery_SELL")
                          .add({
                        "Amount": amountrl.text,
                        "Jewlleryname": jwellery!["Jwellery Name"],
                        "jewlleryid": jwellery?.id
                      });

                      print(c);
                      FirebaseFirestore.instance
                          .collection("JewReg")
                          .doc(ID)
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
