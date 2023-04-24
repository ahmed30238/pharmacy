import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/screens/home/widgets/ask_medication_widget.dart';
import 'package:pharmacy/screens/home/widgets/card_controller.dart';
import 'package:pharmacy/screens/home/widgets/category_widget.dart';
import 'package:pharmacy/screens/home/widgets/shopping_widget.dart';
import '../../controller/get.dart';
import '../../shared/widgets/search_form_field.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //! Search TextFormField
            20.ph,
           const SearchFormField(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'اطلب أدوية',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            //!row اطلب ادوية
            AskForMedication(context:context),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'استخدم كارت التأمين',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),

            //!كارت التامين
            const CardsController(),
            //! two texts
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'عرض الكل',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'اشتري مرة اخري',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            //! Products
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ShoppingWidget(
                    model: shoppingList[index],
                  ),
                  separatorBuilder: (context, index) => 15.pw,
                  itemCount: shoppingList.length,
                ),
              ),
            ),
            //! Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      CategoryWidget(model: categoryList[index]),
                  separatorBuilder: (context, index) => 15.pw,
                  itemCount: categoryList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
