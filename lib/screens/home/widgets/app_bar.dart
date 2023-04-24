import 'package:flutter/material.dart';
import 'package:pharmacy/ex.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.cyan[200],
      elevation: 0,
      actions: [
        10.pw,
        const SizedBox(
          height: 40,
          width: 40,
          child: Image(
            image: AssetImage(
                'assets/pharmacyImages/shop_cart-removebg-preview.png'),
          ),
        ),
        20.pw,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
