import 'package:flutter/material.dart';
import 'package:pharmacy/component/cart_item.dart';
import 'package:pharmacy/component/component.dart';
import 'package:pharmacy/ex.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            10.ph,
            const SafeArea(
              child: Text(
                'عربة التسوق',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
            ),
            20.ph,
            SizedBox(
              height: 350,
              child: ListView.separated(
                physics:const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => cartItem(
                  cartList[index],
                ),
                separatorBuilder: (context, index) => 10.ph,
                itemCount: cartList.length,
              ),
            ),
            Text(
              'استمر بالتسوق',
              style: TextStyle(
                color: Colors.cyan[200],
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            50.ph,

            Align(
              alignment: Alignment.bottomCenter,
              child: defaultButton(onTap: (){}, text: 'الذهاب لتنفيذ الطلبات',),
            ),

          ],
        ),
      ),
    );
  }
}
