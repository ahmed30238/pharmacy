import 'package:flutter/material.dart';
import 'package:pharmacy/ex.dart';

PreferredSizeWidget appBar() => AppBar(
      backgroundColor: Colors.cyan[200],
      elevation: 0,
      actions: [
        10.pw,
        const SizedBox(
          height: 40,
          width: 40,
          child: Image(
              image: AssetImage(
                  'assets/pharmacyImages/shop_cart-removebg-preview.png')),
        ),
        20.pw
      ],
    );
