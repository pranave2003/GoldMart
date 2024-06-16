import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userbuyview extends StatefulWidget {
  const Userbuyview({super.key, required this.jewbuyid});
  final String jewbuyid;

  @override
  State<Userbuyview> createState() => _UserbuyviewState();
}

class _UserbuyviewState extends State<Userbuyview> {
  String? spuserid;
  DocumentSnapshot? Jewsell;
  DocumentSnapshot? JEWREG;
  DocumentSnapshot? UserReG;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    spuserid = spref.getString("userid");
  }

  Future<void> fetchAllData() async {
    await getData();
    if (spuserid != null) {
      Jewsell = await FirebaseFirestore.instance
          .collection('Jewllery_SELL')
          .doc(widget.jewbuyid)
          .get();
      if (Jewsell != null) {
        JEWREG = await FirebaseFirestore.instance
            .collection('JewReg')
            .doc(Jewsell!["jewlleryid"])
            .get();
      }
      UserReG = await FirebaseFirestore.instance
          .collection('UserReg')
          .doc(spuserid)
          .get();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchAllData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: Center(child: Text("Error: ${snapshot.error}")),
          );
        }

        if (Jewsell == null || JEWREG == null || UserReG == null) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: Center(child: Text("No data available")),
          );
        }

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        detailRow("NAME", Jewsell!["Jewlleryname"]),
                        detailRow("GRAM", Jewsell!["gram"]),
                        detailRow("AMOUNT", "RS:${Jewsell!["amount"]}",
                            isAmount: true),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        detailRow("OWNER", UserReG!["User Name"]),
                        detailRow("BALANCE GOLD GRAM", UserReG!["GOLD"]),
                        detailRow("BALANCE AMOUNT", "RS:${UserReG!["AMOUNT"]}",
                            isAmount: true),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        handleBuy();
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "BUY",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget detailRow(String label, String value, {bool isAmount = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: Text(
              label,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Text(
            ": ",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: isAmount ? 25 : 20,
                color: isAmount ? Colors.green : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleBuy() {
    int jewllerybalance = int.parse(UserReG!["AMOUNT"]);
    int usersellamount = int.parse(Jewsell!["amount"]);
    int usersellgold = int.parse(Jewsell!["gram"]);
    int userbalanceamount = int.parse(JEWREG!["AMOUNT"]);
    int jewllerytotalgold = int.parse(UserReG!["GOLD"]);

    var afterbuyjetsidebalanse = jewllerybalance - usersellamount;
    var afterbuyjetsidegold = usersellgold + jewllerytotalgold;
    var afteruseramount = userbalanceamount + usersellamount;

    if (jewllerybalance > usersellamount) {
      FirebaseFirestore.instance.collection("UserReg").doc(spuserid).update({
        "AMOUNT": afterbuyjetsidebalanse.toString(),
        "GOLD": afterbuyjetsidegold.toString()
      });
      FirebaseFirestore.instance
          .collection("Jewllery_SELL")
          .doc(Jewsell?.id)
          .update({"status": "1", "Buyinguserownerid": spuserid});
      FirebaseFirestore.instance
          .collection("JewReg")
          .doc(JEWREG?.id)
          .update({"AMOUNT": afteruseramount.toString()});
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Invalid amount. Please check and try again.",
          style: TextStyle(color: Colors.red),
        ),
      ));
    }
  }
}
