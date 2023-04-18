import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/model/model.dart';
import 'package:pharmacy/screens/cart_screen.dart';
import 'package:pharmacy/screens/category_screen.dart';
import 'package:pharmacy/screens/layout.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final InputBorder? border; // outline or underLine
  final String? Function(String? value) validator;
  final bool? filled;
  final Function(String? value)? onSubmitted;
  const DefaultTextFormField({
    Key? key,
    this.controller,
    required this.validator,
    this.filled,
    this.labelText,
    this.onSubmitted,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        filled: filled,
        border: border,
        labelText: labelText,
      ),
    );
  }
}

Widget defaultButton({
  required Function() onTap,
  double height = 52,
  double width = 227,
  Color color = Colors.red,
  required String text,
  Color textColor = Colors.white,
  FontWeight? fontWeight,
  double? fontSize = 20,
}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );

navigateTo(context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

Widget categoryScreenWidget(PharmacyItemsModel model) => Container(
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

navigateAndFinish(context, Widget screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

Widget imageContainer(double height, double width, String image) => SizedBox(
      height: height,
      width: width,
      child: Image(
        image: AssetImage(image),
      ),
    );

Widget searchFormField() => Center(
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 45,
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text(
              'ما الذي تبحث عنه؟',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            filled: true,
            fillColor: Colors.red,
          ),
        ),
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
List<Widget> screens =  [
  const LayOutScreen(),
  const CategoryScreen(),
  CartScreen(),
];
Widget drawerItemsWidget(PharmacyItemsModel model) => Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          model.description,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        imageContainer(
          70,
          70,
          model.image,
        ),
      ],
    );
List<PharmacyItemsModel> drawerList = [
  PharmacyItemsModel(
    'assets/pharmacyImages/A-removebg-preview.png',
    'المنتجات',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/A-removebg-preview.png',
    'القسائم',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/A-removebg-preview.png',
    'الروشتات الالكترونية',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/A-removebg-preview.png',
    'طلباتك',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/A-removebg-preview.png',
    'اعدادات الحساب',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/A-removebg-preview.png',
    'الدعم والمساعدة',
  ),
];
