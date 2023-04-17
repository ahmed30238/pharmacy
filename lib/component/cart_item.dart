import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/bloc/cubit.dart';
import 'package:pharmacy/bloc/states.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/model/model.dart';

import 'component.dart';

Widget cartItem(
  PharmacyItemsModel model,
) =>
    BlocProvider(
      create: (BuildContext context) => PharmacyCubit(),
      child: BlocConsumer<PharmacyCubit,PharmacyStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = PharmacyCubit.get(context);
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                            10.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    cubit.deccremetCount();
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
                                      child: Text(
                                        '${cubit.counter}',
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.cyan[600]),
                                      )),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    cubit.incrementCount();
                                  },
                                  backgroundColor: Colors.amberAccent,
                                  child: const Icon(
                                    Icons.add,
                                    size: 50,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.pw,
                    Expanded(
                      child: imageContainer(
                        120,
                        30,
                        model.image,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );

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
];

//
