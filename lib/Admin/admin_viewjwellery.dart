import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/Admin/admin_jwellery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminJwellview extends StatefulWidget {
  const AdminJwellview({super.key, required this.id});
  final id;

  @override
  State<AdminJwellview> createState() => _AdminJwellviewState();
}

class _AdminJwellviewState extends State<AdminJwellview> {
  GETDOC() async {
    jewuser = await FirebaseFirestore.instance
        .collection('JewReg')
        .doc(widget.id)
        .get();
  }

  DocumentSnapshot? jewuser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GETDOC(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError)
        {
          return Text("Error:${snapshot.error}");
        }

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 122,
            backgroundColor: Colors.amberAccent,
            shadowColor: Colors.white,
            elevation: 2,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminJwellery()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Edit",
                        style: GoogleFonts.inriaSerif(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .010,
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .060,
              ),
            ],
          ),
          backgroundColor: Colors.black,
          body: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .09,
                    width: MediaQuery.of(context).size.width * .15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),

                  Row(
                    children: [
                      Text(
                        "Jwellery name:",
                        style: TextStyle(color: Colors.grey),
                      ), SizedBox(width: 10,),
                      Text(
                        jewuser!["Jwellery Name"],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Divider(
                    color: Colors.grey,
                    endIndent: 20,
                  ),
                  Text(
                    "Owner Name:",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    jewuser!["Owner Name"],
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Divider(
                    color: Colors.grey,
                    endIndent: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Text(
                    "GST Number:",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    jewuser!["GST Number"],
                    style: TextStyle(color: Colors.grey),
                  ),
                  Divider(
                    endIndent: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Text(
                    "Licence Number:",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    jewuser!["Licence Number"],
                    style: TextStyle(color: Colors.grey),
                  ),
                  Divider(
                    endIndent: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Text(
                    "Address:",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    jewuser!["Address"],
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Divider(
                    endIndent: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Text(
                    "Phone Number:",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    jewuser!["Phone Number"],
                    style: TextStyle(color: Colors.grey),
                  ),
                  Divider(
                    endIndent: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    jewuser!["Mail"],
                    style: TextStyle(color: Colors.grey),
                  ),
                  Divider(
                    endIndent: 20,
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(left: 25),
                  //   child: InkWell(onTap: (){
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => AdminJwellery()));
                  //   },
                  //     child: Container(
                  //         child: Row(
                  //           children: [
                  //             SizedBox(
                  //               width: MediaQuery.of(context).size.width * 0.3,
                  //             ),
                  //             Text("Logout",
                  //                 style: GoogleFonts.ubuntu(
                  //                     color: Colors.black, fontSize: 20)),
                  //             SizedBox(
                  //               width: MediaQuery.of(context).size.width * 0.015,
                  //             ),
                  //             Icon(Icons.login_outlined,color: Colors.white,)
                  //           ],
                  //         ),
                  //         height: MediaQuery.of(context).size.height * 0.07,
                  //         width: MediaQuery.of(context).size.width * 0.8,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10),
                  //           color: Color(0xFFFACD18),
                  //         )),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
