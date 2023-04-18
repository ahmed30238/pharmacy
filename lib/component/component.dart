import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/model/model.dart';
import 'package:pharmacy/screens/cart_screen.dart';
import 'package:pharmacy/screens/category_screen.dart';
import 'package:pharmacy/screens/layout.dart';

class CategoryScreenWidget extends StatelessWidget {
  final PharmacyItemsModel model;
  const CategoryScreenWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 140,
              width: 140,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  model.image,
                ),
              ),
            ),
          ),
          5.ph,
          Center(
            child: Text(
              model.description,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget imageContainer(double height, double width, String image) => SizedBox(
      height: height,
      width: width,
      child: Image(
        image: AssetImage(image),
      ),
    );


var bottomNavBarList = [
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
  CurvedNavigationBarItem(
    child: Expanded(
      child: imageContainer(
        25,
        25,
        'assets/pharmacyImages/shop_cart-removebg-preview.png',
      ),
    ),
    label: 'Cart',
  ),
];
List<Widget> screens = [
  const LayOutScreen(),
  const CategoryScreen(),
  CartScreen(),
];

class DrawerItemsWidget extends StatelessWidget {
  final PharmacyItemsModel model;
  const DrawerItemsWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            model.description,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(15),
          ),
          imageContainer(
            31,
            31,
            model.image,
          ),
        ],
      ),
    );
  }
}

List<PharmacyItemsModel> drawerList = [
  PharmacyItemsModel(
    'assets/pharmacyImages/star.png',
    'المنتجات',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/file.png',
    'القسائم',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/contract.png',
    'الروشتات الالكترونية',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/true-removebg-preview.png',
    'طلباتك',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/setting.png',
    'اعدادات الحساب',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/communication.png',
    'الدعم والمساعدة',
  ),
];
