import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmacy/shared/init_bindings.dart';
import 'package:pharmacy/shared/routing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitBinding().dependencies();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<GetPage> getPagesList = [
    SplashRouting.config().page,
    LoginRouting.config().page,
    RegisterRouting.config().page,
    LayoutRouting.config().page,
    HomeRouting.config().page
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 900),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: GetMaterialApp(
            locale: const Locale('ar'),
            getPages: getPagesList,
            debugShowCheckedModeBanner: false,
            initialBinding: InitBinding(),
            initialRoute: SplashRouting.config().path,
          ),
        );
      },
    );
  }
}
