import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:demo/Jwellery/jwellerybottombutton.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'jwellery_register.dart';

class JwelleryLogin extends StatefulWidget {
  const JwelleryLogin({super.key});

  @override
  State<JwelleryLogin> createState() => _JwelleryLoginState();
}

class _JwelleryLoginState extends State<JwelleryLogin> {
  final formkey = GlobalKey<FormState>();
  var mail = TextEditingController();
  var password = TextEditingController();
  String id = "";
  void jwellLogin() async {
    final user = await FirebaseFirestore.instance
        .collection('JewReg')
        .where('Mail', isEqualTo: mail.text)
        .where('Password', isEqualTo: password.text)
        .get();
    if (user.docs.isNotEmpty) {
      id = user.docs[0].id;
      print('done');

      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('id', id);
      print("get sp");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomButton(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "username and password error",
        style: TextStyle(color: Colors.red),
      ))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/WOMEN.png'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login/Register',
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Start to save Everyday.",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: mail,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter valid email';
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      gapPadding: 10,
                    ),
                    labelText: "Enter your Email",
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(75, 70, 70, 1),
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter correct password ';
                    }
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      gapPadding: 10,
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(75, 70, 70, 1),
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      jwellLogin();
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return JwelleryRegister();
                            },
                          ));
                        },
                        child: Text(
                          "Create an account",
                          style: TextStyle(color: Colors.amber),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
