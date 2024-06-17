import 'package:demo/Admin/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  adlogin() {
    if (email.text == 'admin@gmail.com' && password.text == '123') {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return AdminHome();
        },
      ));
    }
  }

  final formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/gold.jpg"), fit: BoxFit.cover)),
        padding: EdgeInsets.all(60),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: email,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(),
                    labelText: "username/Email",
                    labelStyle: TextStyle(color: Colors.white30)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter valid username/Email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: password,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white30)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter correct password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    adlogin();
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
                          "LOGIN",
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
