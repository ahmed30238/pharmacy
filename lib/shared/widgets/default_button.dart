import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
        height: height ?? 52,
        width: width ?? 227,
        decoration: BoxDecoration(
          color: color ?? Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: fontWeight ?? FontWeight.bold,
              fontSize: fontSize ?? 20,
            ),
          ),
        ),
      ),
    );
  }
}
