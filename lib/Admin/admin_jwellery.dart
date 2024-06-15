import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/Admin/admin_user.dart';
import 'package:demo/Admin/admin_viewjwellery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminJwellery extends StatefulWidget {
  const AdminJwellery({super.key});

  @override
  State<AdminJwellery> createState() => _AdminJwelleryState();
}

class _AdminJwelleryState extends State<AdminJwellery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Center(
              child: Text(
            "Jwellery",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
        ),
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("JewReg").get(),
          builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if(snapshot.hasError)
              {
                return Text("Error:${snapshot.error}");
              }
            final JwellList=snapshot.data?.docs??[];
            return  ListView.builder(
              itemCount: JwellList.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
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
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AdminJwellview(
                                              id:JwellList[index].id
                                            ),
                                          ));
                                    },
                                    child: Icon(CupertinoIcons.eye)),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * .03,
                                ),

                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        FirebaseFirestore.instance.collection("JewReg").doc(JwellList[index].id).delete();
                                      });
                                    },
                                    child: Icon(CupertinoIcons.delete)),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                );
              },
            );
          },

        ));
  }
}
