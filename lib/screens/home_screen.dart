import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/component/component.dart';
import 'package:pharmacy/component/home_screen_component.dart/app_bar.dart';
import 'package:pharmacy/component/home_screen_component.dart/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      persistentFooterAlignment: AlignmentDirectional.topEnd,
      backgroundColor: Colors.cyan[200],
      appBar: appBar(),
      drawer: drawer(
        context: context,
        scaffoldKey: scaffoldKey,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        index: currentIndex,
        height: 55,
        items: bottomNavBarList,
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 106, 228, 244),
      ),
    );
  }
}
