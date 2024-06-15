import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'jwellery_login.dart';

class JwelleryRegister extends StatefulWidget {
  const JwelleryRegister({super.key});

  @override
  State<JwelleryRegister> createState() => _JwelleryRegisterState();
}

class _JwelleryRegisterState extends State<JwelleryRegister> {
  final formkey = GlobalKey<FormState>();
  var jwelleryname = TextEditingController();
  var ownername = TextEditingController();
  var gstnumber = TextEditingController();
  var licencenumber = TextEditingController();
  var address = TextEditingController();
  var phonenumber = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmpassword = TextEditingController();
  Future<dynamic> JwellReg() async {
    print("done");
    await FirebaseFirestore.instance.collection("JewReg").add({
      "Jwellery Name": jwelleryname.text,
      "Owner Name": ownername.text,
      "GST Number": gstnumber.text,
      "Licence Number": licencenumber.text,
      "Address": address.text,
      "Phone Number": phonenumber.text,
      "Mail": email.text,
      "Password": password.text,
      "Confirm Password": confirmpassword.text,
      "path": "https://www.dpjewellers.com/images/gold-catl-07.webp",
      "AMOUNT":"0"
    });
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return JwelleryLogin();
      },
    ));
    print('registration success');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "JEWLLERY REGISTER",
            style: TextStyle(color: Colors.amber),
          ),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/gold.jpg"), fit: BoxFit.fill)),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
                width: 3,
              ),
              Text(
                'Jwellery Name',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: jwelleryname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter required details";
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(
                        // gapPadding: 10,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Text(
                'Owner Name',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: ownername,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter required details";
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(
                        // gapPadding: 10,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 3,
              ),
              Text(
                'GST Number',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: gstnumber,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter required details";
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(
                        // gapPadding: 10,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Text(
                'Licence Number',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: licencenumber,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter required details";
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(
                        // gapPadding: 10,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Text(
                'Address',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: address,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter required details";
                    }
                  },
                  minLines: 3,
                  maxLines: 3,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(
                        // gapPadding: 10,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phonenumber,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter required details";
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(
                        // gapPadding: 10,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 3,
              ),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter required details";
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white30,
                      border: OutlineInputBorder(
                          // gapPadding: 10,
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Enter your Email",
                      labelStyle: TextStyle(color: Color(0xFF747070))),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
                width: MediaQuery.of(context).size.width * .03,
              ),
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .010,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter required details";
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white30,
                      border: OutlineInputBorder(
                          // gapPadding: 10,
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Color(0xFF747070))),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .010,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: confirmpassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter required details";
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white30,
                      border: OutlineInputBorder(
                          // gapPadding: 10,
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(color: Color(0xFF747070))),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .030,
              ),
              InkWell(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    JwellReg();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber),
                      child: Center(
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
