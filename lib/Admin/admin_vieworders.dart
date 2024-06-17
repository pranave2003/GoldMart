import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Jwellery/jewlleryorder.dart';
import '../User/Userorder.dart';
import 'Jeworderlist.dart';
import 'Userorderlist.dart';

class AdminOrders extends StatefulWidget {
  const AdminOrders({super.key});

  @override
  State<AdminOrders> createState() => _AdminOrdersState();
}

class _AdminOrdersState extends State<AdminOrders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Container(
                  height: 50,
                  // width: 330.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white30),
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                    ),
                    tabs: [
                      Tab(
                          child: Text(
                        'JEWLLERS',
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      )),
                      Tab(
                          child: Text(
                        'USERS',
                        style: TextStyle(
                          // color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Expanded(
              child: TabBarView(children: [Jewlleryorder(), Userordersell()]),
            )
          ],
        ),
      ),
    );
  }
}
