import 'package:flutter/material.dart';
import 'package:one_data_card/sections/gov.dart';
import 'package:one_data_card/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List Pages = [Gov()];

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  "Personal card",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.teal[300],
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.qr_code_outlined,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.balance_outlined,
                color: primaryColor,
              ),
              label: "Gov",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_sharp, color: primaryColor),
              label: "Financial",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital, color: primaryColor),
              label: "Medical",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: primaryColor),
              label: "personal",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school, color: primaryColor),
              label: "Educational",
            ),
          ]),
    );
  }
}
