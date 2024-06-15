import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/User/user_buydetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserBuy extends StatefulWidget {
  const UserBuy({super.key});

  @override
  State<UserBuy> createState() => _UserBuyState();
}

class _UserBuyState extends State<UserBuy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              title: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: Icon(CupertinoIcons.search),
                  fillColor: Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                      // gapPadding: 10,
                      borderRadius: BorderRadius.circular(45)),
                  labelText: "Search",
                  labelStyle: TextStyle(color: Color(0xFF747070)),
                ),
              ),
            ),
            backgroundColor: Colors.black,
            body: FutureBuilder(
              future: FirebaseFirestore.instance.collection("JewReg").get(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text("Error:${snapshot.error}");
                }
                final JwellList = snapshot.data?.docs ?? [];
                return ListView.builder(
                  itemCount: JwellList.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          Card(
                              child: ListTile(
                            leading: Text(
                              JwellList[index]["Jwellery Name"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UserBuyDetails(
                                                    id: JwellList[index].id),
                                          ));
                                    },
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Buy",
                                          style: TextStyle(color: Colors.black),
                                        ))),
                                //   SizedBox(
                                //     height: MediaQuery.of(context).size.height * .03,
                                //   ),
                                //
                                //  InkWell(
                                //    onTap: (){
                                //
                                //    },
                                //      child: ElevatedButton(onPressed: (){}, child: Text("Buy",style: TextStyle(color: Colors.black),)))
                              ],
                            ),
                          )),

                        ],
                      ),
                    );
                  },
                );
              },
            )));
  }
}
