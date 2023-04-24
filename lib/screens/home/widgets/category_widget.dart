import 'package:flutter/material.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/model/model.dart';

class CategoryWidget extends StatelessWidget {
 final PharmacyItemsModel model;
  const CategoryWidget({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
          ),
          child: Center(
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
    );
  }
}

List<PharmacyItemsModel> categoryList = [
  PharmacyItemsModel(
    'assets/pharmacyImages/pngtree-cigarette-png-image_7076252.png',
    'أدوية للاقلاع عن التدخين',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/mother_baby.jpg',
    'منتجات الطفل',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/sale.jpg',
    'العروض',
  ),
];
List<PharmacyItemsModel> browseCaegoryList = [
  PharmacyItemsModel(
    'assets/pharmacyImages/Coronavirus-EN-2_2.png',
    'البرد والسعال',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/vitamines.jpg',
    'الفيتامينات والمكملات الغذائية',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/pngtree_woman_with_dollar_banknote_on_mouth_png_image_8800314.png',
    'عناية الفم',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/th.jpg',
    'مضادات حبوب موضعية',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/pngtree-sugar-vector-png-image_8229521.png',
    'ادية مرض السكر',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/29-1.png',
    'مستحضرات تجميل',
  ),
];
