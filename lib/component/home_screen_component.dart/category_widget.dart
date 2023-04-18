import 'package:flutter/material.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/model/model.dart';

Widget categoryWidget(PharmacyItemsModel model) => Column(
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
List<PharmacyItemsModel> categoryList = [
  PharmacyItemsModel(
    'assets/pharmacyImages/communication.png',
    'مستلزمات',
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