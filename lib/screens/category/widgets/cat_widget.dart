import 'package:flutter/material.dart';
import 'package:pharmacy/ex.dart';

import '../../../model/model.dart';

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