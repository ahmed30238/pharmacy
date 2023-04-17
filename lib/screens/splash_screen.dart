import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/screens/login_Screen.dart';
import 'package:pharmacy/component/component.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  Animation<double>? animation;

  startTime() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, navigator);
  }

  void navigator() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.linear,
    );

    animation!.addListener(() => setState(() {}));
    animationController!.repeat(reverse: false);
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: animation!,
                  child: Center(
                    child: imageContainer(200, 200,
                        'assets/pharmacyImages/logo-removebg-preview.png'),
                  ),
                ),
                const Center(
                  child: Text(
                    'صيدليتى',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              40.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text(
                        'اطلب الروشتة او الادوية',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    10.pw,
                    imageContainer(
                      60,
                      60,
                      'assets/pharmacyImages/true-removebg-preview.png',
                    ),
                  ],
                ),
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text(
                        'تسوق منتجات الصحة والجمال',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    10.pw,
                    imageContainer(60, 60,
                        'assets/pharmacyImages/true-removebg-preview.png'),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
