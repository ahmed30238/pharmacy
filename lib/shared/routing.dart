import 'package:pharmacy/screens/home_screen.dart';
import 'package:pharmacy/screens/layout.dart';
import 'package:pharmacy/screens/login_Screen.dart';
import 'package:pharmacy/screens/register_screen.dart';
import 'package:pharmacy/screens/splash_screen.dart';
import 'package:pharmacy/shared/routing_config.dart';

class SplashRouting extends RoutingConfig {
  SplashRouting();
  static RoutingConfig config() => RoutingConfig(
        path: '/splash/',
        widget: const SplashScreen(),
      );
}

class LoginRouting extends RoutingConfig {
  LoginRouting();
  static RoutingConfig config() => RoutingConfig(
    path: '/login/',
    widget: LoginScreen(),
  );
}

class RegisterRouting extends RoutingConfig {
  RegisterRouting();
  static RoutingConfig config() => RoutingConfig(
    path: '/register/',
    widget: RegisterScreen(),
  );
}

class LayoutRouting extends RoutingConfig {
  LayoutRouting();
  static RoutingConfig config() => RoutingConfig(
    path: '/layout/',
    widget:const LayOutScreen(),
  );
}
class HomeRouting extends RoutingConfig {
  HomeRouting();
  static RoutingConfig config() => RoutingConfig(
    path: '/home/',
    widget:const HomeScreen(),
  );
}


