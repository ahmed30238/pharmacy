import 'package:flutter/material.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/screens/category/widgets/cat_widget.dart';

import '../../shared/widgets/search_form_field.dart';
import '../home/widgets/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          // height: MediaQuery.of(context).size.height,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.ph,
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: SearchFormField(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'عرض الكل',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const Text(
                      'اشتري مرة اخري',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ].reversed.toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 220,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        CategoryScreenWidget(model: categoryList[index]),
                    separatorBuilder: (context, index) => 15.pw,
                    itemCount: categoryList.length,
                  ),
                ),
              ),
              //!تصفح الاقسام
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  'تصفح الاقسام',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                childAspectRatio: .9,
                crossAxisSpacing: 0,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(
                  browseCaegoryList.length,
                  (index) => CategoryWidget(
                    model: browseCaegoryList[index],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
