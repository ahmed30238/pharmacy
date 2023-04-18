import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function() onTap;
  double? height = 52;
  double? width = 227;
  Color? color = Colors.red;
  final String text;
  Color? textColor = Colors.white;
  final FontWeight? fontWeight;
  double? fontSize = 20;
  DefaultButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.textColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}