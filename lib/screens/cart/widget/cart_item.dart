import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmacy/controller/get.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/model/model.dart';

import '../../../shared/widgets/my_image_container.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  final PharmacyItemsModel model;
  final int index;

  CartItem({
    super.key,
    required this.model,
    required this.index,
  });
  // Controller controller = Get.find();
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: ScreenUtil().setHeight(245),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          model.description,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          model.price!,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan[300],
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.ph,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              if (controller.counters[index] > 0) {
                                controller.decrementCount(btnNum: index);
                              }
                              if (kDebugMode) {
                                print(index);
                              }
                            },
                            backgroundColor: Colors.red,
                            child: const Icon(
                              Icons.delete,
                              size: 50,
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.cyan[200],
                              border: Border.all(
                                color: Colors.grey.shade500,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                                child: GetBuilder<Controller>(
                              builder: (controller) => Text(
                                '${controller.counters[index]}',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan[600]),
                              ),
                            )),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              controller.incrementCount(btnNum: index);
                              if (kDebugMode) {
                                print(index);
                              }
                            },
                            backgroundColor: Colors.amberAccent,
                            child: const Icon(
                              Icons.add,
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            10.pw,
            Expanded(
              child: ImageContainer(
                height: 120,
                width: 30,
                image: model.image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<PharmacyItemsModel> cartList = [
  PharmacyItemsModel(
    'assets/pharmacyImages/heads&shoulder.jpg',
    'مجموعة الشامبو المضاد للقشرة',
    price: '275.00 جنيه',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/pampers.jpg',
    'حفاضات للاطفال سن الولادة',
    price: '170.00 جنيه',
  ),
  PharmacyItemsModel(
    'assets/pharmacyImages/pampers.jpg',
    'حفاضات للاطفال سن الولادة',
    price: '170.00 جنيه',
  ),
];
