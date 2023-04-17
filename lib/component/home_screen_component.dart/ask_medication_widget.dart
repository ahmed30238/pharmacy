import 'package:flutter/material.dart';
import 'package:pharmacy/component/camera_method.dart';
import 'package:pharmacy/component/component.dart';
import 'package:pharmacy/ex.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget askForMedication(context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  getPrescribeImage().then((value) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool(
                      'prescribeImage',
                      true,
                    );
                  });
                },
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.cyan[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'صور الروشتة',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                      5.pw,
                      Expanded(
                        child: imageContainer(
                          40,
                          40,
                          'assets/pharmacyImages/note-removebg-preview.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            10.pw,
            Expanded(
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.cyan[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'ابحث عن ادوية',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    5.pw,
                    Expanded(
                      child: imageContainer(40, 40,
                          'assets/pharmacyImages/medicine-removebg-preview.png'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
