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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          defaultButton(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              bool isThereImages = prefs.getBool('prescribeImage') ?? false;
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
    );
