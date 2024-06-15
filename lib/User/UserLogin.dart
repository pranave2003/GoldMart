import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/Jwellery/jwellerybottombutton.dart';
import 'package:demo/User/UserRegister.dart';
import 'package:demo/User/user_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'User_profile.dart';
import 'UserBottom.dart';

class Userlogin extends StatefulWidget {
  const Userlogin({super.key});

  @override
  State<Userlogin> createState() => _UserloginState();
}

class _UserloginState extends State<Userlogin> {
  final formkey = GlobalKey<FormState>();
  var mail = TextEditingController();
  var password = TextEditingController();
  String id = "";
  void userLogin() async {
    final user = await FirebaseFirestore.instance
        .collection('UserReg')
        .where('Email', isEqualTo: mail.text)
        .where('Password', isEqualTo: password.text)
        .get();
    if (user.docs.isNotEmpty) {
      id = user.docs[0].id;
      print('done');

      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('userid', id);
      print("get sp");
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Userbottom();
        },
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "username and password error",
        style: TextStyle(color: Colors.red),
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/WOMEN.png'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' User Login',
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Start to save Everyday.",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: mail,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your Email ';
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
                      userLogin();
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
                SizedBox(
                  height: 3,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserRegister(),
                              ));
                        },
                        child: Text(
                          "Create an account",
                          style: TextStyle(color: Colors.amber.shade600),
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
