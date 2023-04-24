import 'package:flutter/cupertino.dart';

class ImageContainer extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  const ImageContainer(
      {Key? key,
      required this.width,
      required this.height,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image(
        image: AssetImage(image),
      ),
    );
  }
}
