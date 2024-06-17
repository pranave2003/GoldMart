import 'package:demo/Admin/admin_jwellery.dart';
import 'package:demo/Admin/admin_user.dart';
import 'package:flutter/material.dart';

import 'admin_vieworders.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/A11.png"), fit: BoxFit.fill)),
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 30,),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminUser(),
                    ));
              },
              child: Container(
                height: 78,
                width: 197,
                child: Center(
                  child: Text(
                    "User",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminJwellery(),
                    ));
              },
              child: Container(
                height: 78,
                width: 197,
                child: Center(
                  child: Text(
                    "Jwellery",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AdminOrders();
                  },
                ));
              },
              child: Container(
                height: 78,
                width: 197,
                child: Center(
                  child: Text(
                    "Orders",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
