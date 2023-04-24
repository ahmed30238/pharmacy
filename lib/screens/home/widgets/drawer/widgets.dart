import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../model/model.dart';
import '../../../../shared/widgets/my_image_container.dart';

class DrawerItemsWidget extends StatelessWidget {
  final PharmacyItemsModel model;
  const DrawerItemsWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            model.description,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(15),
          ),
          ImageContainer(
            height: 31,
            width: 31,
            image: model.image,
          ),
        ],
      ),
    );
  }
}