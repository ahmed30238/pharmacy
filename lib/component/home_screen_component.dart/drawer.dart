import 'package:flutter/material.dart';
import 'package:pharmacy/component/camera_method.dart';
import 'package:pharmacy/component/component.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/screens/login_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget drawer({
  context,
  GlobalKey<ScaffoldState>? scaffoldKey,
}) =>
    Drawer(
      // key: ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'مرحبا',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Mohamed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          3.ph,
          Divider(
            height: 2,
            color: Colors.grey.shade800,
          ),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //drawerItems
                Expanded(
                  child: SizedBox(
                      child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      drawerList.length,
                      (index) => drawerItemsWidget(
                        drawerList[index],
                      ),
                    ),
                  )),
                ),

                defaultButton(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    bool isThereImages =
                        prefs.getBool('prescribeImage') ?? false;
                    scaffoldKey!.currentState!.showBottomSheet(
                      (context) => SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: isThereImages && prescribeImage != null
                            ? Image(
                                image: FileImage(prescribeImage!),
                              )
                            : const Center(
                                child: Text('No Images'),
                              ),
                      ),
                    );
                  },
                  text: 'Show prescription',
                ),
                10.ph,
                defaultButton(
                  onTap: () {
                    navigateAndFinish(
                      context,
                      LoginScreen(),
                    );
                  },
                  text: 'log out',
                ),
                20.ph
              ],
            ),
          ),
        ],
      ),
    );
