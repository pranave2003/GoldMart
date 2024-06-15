import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JewlleryBuy extends StatefulWidget {
  const JewlleryBuy({super.key});

  @override
  State<JewlleryBuy> createState() => _JewlleryBuyState();
}

class _JewlleryBuyState extends State<JewlleryBuy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            enableFeedback: true,
            leading: CircleAvatar(),
            title: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                )
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discount amount",
                  style: TextStyle(color: Colors.amber),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 80,
                    child: Center(
                      child: Text(
                        "BUY",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
