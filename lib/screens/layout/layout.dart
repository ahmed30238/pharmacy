import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pharmacy/controller/get.dart';
import 'package:pharmacy/screens/home/home.dart';
import '../../shared/widgets/my_image_container.dart';
import '../cart/cart_screen.dart';
import '../category/category_screen.dart';
import '../home/widgets/app_bar.dart';
import '../home/widgets/drawer/drawer.dart';


class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  Controller controller = Get.find();

  List<CurvedNavigationBarItem> bottomNavBarList = [
    const CurvedNavigationBarItem(
      child: Icon(Icons.home),
      label: 'Home',
    ),
    const CurvedNavigationBarItem(
      child: Icon(
        Icons.category_outlined,
        color: Colors.black,
      ),
      label: 'Category',
    ),
    const CurvedNavigationBarItem(
      child: Expanded(
        child: ImageContainer(
          height: 25,
          width:  25,
          image: 'assets/pharmacyImages/shop_cart-removebg-preview.png',
        ),
      ),
      label: 'Cart',
    ),
  ];
  List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    CartScreen(),
  ];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      persistentFooterAlignment: AlignmentDirectional.topEnd,
      backgroundColor: Colors.cyan[200],
      appBar: const CustomAppBar(),
      drawer: MyDrawer(
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
