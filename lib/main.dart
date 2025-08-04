import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmacy/controller/get.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/shared/init_bindings.dart';
import 'package:pharmacy/shared/routing.dart';
import 'package:pharmacy/shared/theme/theme_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  InitBinding().dependencies();
  Varr varr = Varr();
  varr.setName("n");
  print("$varr");
  runApp(const MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  // update flutter version + release tag

  List<GetPage> getPagesList = [
    SplashRouting.config().page,
    LoginRouting.config().page,
    RegisterRouting.config().page,
    LayoutRouting.config().page,
    HomeRouting.config().page
  ];

  @override
  Widget build(BuildContext context) {
    var f = Get.put(Controller());
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
            theme: ThemeData.light(),
            themeMode: f.theme,
            darkTheme: ThemeData.dark(),
            initialBinding: InitBinding(),
            initialRoute: SplashRouting.config().path,
          ),
        );
      },
    );
  }
}
