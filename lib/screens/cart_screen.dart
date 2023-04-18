import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmacy/component/cart_item.dart';
import 'package:pharmacy/component/widgets/default_button.dart';
import 'package:pharmacy/controller/get.dart';
import 'package:pharmacy/ex.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(750, 1334),
    );

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
            SizedBox(height: ScreenUtil().setHeight(10)),
            SizedBox(
              height: ScreenUtil().setHeight(550),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  for (int x = 0; x < cartList.length; x++) {
                    controller.counters.add(0);
                  }
                  return CartItem(
                    model: cartList[index],
                    index: index,
                  );
                },
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
              child: DefaultButton(
                onTap: () {},
                text: 'الذهاب لتنفيذ الطلبات',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
