import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'UserSell.dart';
import 'Userbuy.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final List<String> imgList = [
    'https://th.bing.com/th/id/OIP.wc_NiF4LrfcgvRlUTwSiRAHaDt?w=340&h=175&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://static.vecteezy.com/system/resources/thumbnails/016/896/023/small_2x/special-offer-90-percent-off-selling-with-golden-3d-number-vector.jpg',
    'https://th.bing.com/th/id/OIP.hbySObaBStmP5eb31PTR3wAAAA?rs=1&pid=ImgDetMain',
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          " USER GOLD MART",
          style: GoogleFonts.almendra(
              textStyle: TextStyle(color: Colors.blue.shade100, fontSize: 35)),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.note,
                color: Colors.white,
              )),
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/gold.jpg"))),
        child: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                scrollDirection: Axis.horizontal,
              ),
              items: imgList
                  .map((item) => Container(
                        child: Center(
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 1000),
                        ),
                      ))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white30,
                child: ListTile(
                  leading: Icon(Icons.monetization_on, color: Colors.amber),
                  title: Text(
                    "Current Gold Rate",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  subtitle: Text(
                    "RS.6894",
                    style: TextStyle(color: Colors.blue.shade100, fontSize: 18),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    _launchURL('https://goldrate.com/gold-rate-today/');
                  },
                  child: Container(
                    height: 130,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/market.jpg")),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          "View Rate",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Userbuy();
                      },
                    ));
                  },
                  child: Container(
                    height: 130,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/OIP.jpg")),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          "BUY",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return UserSell();
                      },
                    ));
                  },
                  child: Container(
                    height: 130,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/sell.png"),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          "SELL",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/share.jpg"))),
                child: ListTile(
                  leading: Icon(Icons.show_chart, color: Colors.amber),
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Gold Price Chart",
                      style:
                          TextStyle(color: Colors.blue.shade100, fontSize: 20),
                    ),
                  ),
                  subtitle: Image.asset(
                    "assets/share.jpg", // Placeholder image
                    height: 150,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white30,
                child: ListTile(
                  leading: Icon(Icons.article, color: Colors.amber),
                  title: Text(
                    "Latest Gold News",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          _launchURL(
                              'https://www.news18.com/business/gold-rate-in-mumbai-today-22k-22-carat-24-carat-8933082.html');
                        },
                        child: Text(
                          "Gold prices surge amid economic uncertainty",
                          style: TextStyle(
                              color: Colors.blue.shade100, fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 5),
                      InkWell(
                        onTap: () {
                          _launchURL(
                              'https://www.dailyfx.com/gold-price/news-and-analysis');
                        },
                        child: Text(
                          "Experts predict a bullish trend for gold",
                          style: TextStyle(
                              color: Colors.blue.shade100, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
