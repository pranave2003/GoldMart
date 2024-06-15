import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/User/UserLogin.dart';
import 'package:demo/User/user_welcome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  List<String> option = ['Female', 'Male', 'Other'];
  String curentoption = ('0');
  final formkey = GlobalKey<FormState>();

  var username = TextEditingController();
  var age = TextEditingController();
  var validproof = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmpassword = TextEditingController();
  Future<dynamic> UserReg() async {
    await FirebaseFirestore.instance.collection("UserReg").add({
      "User Name": username.text,
      "Age": age.text,
      "vaild proof": validproof.text,
      "Email": email.text,
      "Gender": curentoption,
      "Password": password.text,
      "Confirm Password": confirmpassword.text,
      "path":
          "https://th.bing.com/th/id/OIP.w2McZSq-EYWxh02iSvC3xwHaHa?w=200&h=200&c=7&r=0&o=5&dpr=1.3&pid=1.7",
      "AMOUNT":"500"
    });
    print('done');
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Userlogin();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formkey,
        child: Scaffold(
            body: Container(
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/details.png'), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Lets get to know \n you.',
                            style: TextStyle(
                                color: Color.fromRGBO(250, 205, 24, 1),
                                fontSize: 30),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .060,
                      ),
                      Row(
                        children: [
                          Text(
                            'whats your name?',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: username,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter required details";
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              // gapPadding: 10,
                              borderRadius: BorderRadius.circular(15)),
                          labelText: "Enter your name",
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(116, 112, 112, 1)),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .010,
                      ),
                      Row(
                        children: [
                          Text(
                            'whats your age?',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: age,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter required details";
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelText: "Enter your age",
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(116, 112, 112, 1)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("What gender do you identify?",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                      Column(
                        children: [
                          ListTile(
                            leading: Radio(
                              value: option[0],
                              groupValue: curentoption,
                              onChanged: (value) {
                                setState(() {
                                  curentoption = value.toString();
                                });
                              },
                            ),
                            title: Text(
                              'Female',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            leading: Radio(
                              value: option[1],
                              groupValue: curentoption,
                              onChanged: (value) {
                                setState(() {
                                  curentoption = value.toString();
                                });
                              },
                            ),
                            title: Text(
                              'male',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            leading: Radio(
                              value: option[2],
                              groupValue: curentoption,
                              onChanged: (value) {
                                setState(() {
                                  curentoption = value.toString();
                                });
                              },
                            ),
                            title: Text(
                              'other',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Upload any valid ID proof',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: validproof,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "upload valid proof";
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(116, 112, 112, 1)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter required details";
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Enter your Email",
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(116, 112, 112, 1)),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter required details";
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Enter your Password",
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(116, 112, 112, 1)),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Confirm Password',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: confirmpassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter required details";
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Confirm your Password",
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(116, 112, 112, 1)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .020,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        UserReg();
                      }
                    },
                    child: Text('submit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(250, 205, 24, 1),
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
