import 'package:flutter/material.dart';

class JwelleryStock extends StatefulWidget {
  const JwelleryStock({super.key});

  @override
  State<JwelleryStock> createState() => _JwelleryStockState();
}

class _JwelleryStockState extends State<JwelleryStock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
        child: Container(
        padding: EdgeInsets.all(50),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
      InkWell(
        onTap: (){
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => AdminUser(),
          //     ));
        },
        child: Container(
          height: 135,
          width: 297,
          child: Center(
            child: Text(
              "Stock",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
      ),
      SizedBox(
        height: 50,
      ),
    ]
    ),
    ),
        ),
    );
  }
}
