import 'package:flutter/material.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/model/model.dart';
import 'package:pharmacy/screens/cart_screen.dart';
import 'package:pharmacy/screens/category_screen.dart';
import 'package:pharmacy/screens/layout.dart';

Widget defaultTextFormField({
  TextEditingController? controller,
  String? labelText,
  InputBorder? border, // outline or underLine
  required String? Function(String? value) validator,
  bool? filled,
  Function(String? value)? onSubmitted,
}) =>
    TextFormField(
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
  SizedBox(
    height: 40,
    child: Column(
      children: const [
        Icon(Icons.home),
        Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ],
    ),
  ),
  SizedBox(
    height: 40,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.category_outlined,
          color: Colors.black,
        ),
        Text(
          'Category',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ],
    ),
  ),
  SizedBox(
    height: 40,
    child: Column(
      children: [
        Expanded(
          child: imageContainer(
            25,
            25,
            'assets/pharmacyImages/shop_cart-removebg-preview.png',
          ),
        ),
        const Expanded(
          child: Text(
            'Cart',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ],
    ),
  ),
];
List<Widget> screens = const [
  LayOutScreen(),
  CategoryScreen(),
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
