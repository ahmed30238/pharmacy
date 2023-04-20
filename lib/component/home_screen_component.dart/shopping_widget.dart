import 'package:flutter/material.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/model/model.dart';

class ShoppingWidget extends StatelessWidget {
 final PharmacyItemsModel model;
  const ShoppingWidget({Key? key,required this.model,}) : super(key: key);

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
        InkWell(
          onTap: (){
            // shoppingList.add(PharmacyItemsModel( 'assets/pharmacyImages/aloekita.jpg' ,'تم'));
          },
          child: Container(
            width: 80,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Center(
              child: Text(
                model.description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


List<PharmacyItemsModel> shoppingList = [
  PharmacyItemsModel(
    'assets/pharmacyImages/aloekita.jpg',
    'اضف',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/heads&shoulder.jpg',
    'اضف',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/pampers.jpg',
    'اضف',
  ),
];