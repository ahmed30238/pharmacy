import 'package:flutter/material.dart';
import 'package:pharmacy/ex.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/methods.dart';
import '../../../shared/widgets/my_image_container.dart';

class AskForMedication extends StatelessWidget {
  const AskForMedication({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  getPrescribeImage().then((value) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool(
                      'prescribeImage',
                      true,
                    );
                  });
                },
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.cyan[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            'صور الروشتة',
                            // textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        5.pw,
                        const ImageContainer(
                          height: 40,
                          width: 40,
                          image:
                              'assets/pharmacyImages/note-removebg-preview.png',
                        ),
                      ].reversed.toList(),
                    ),
                  ),
                ),
              ),
            ),
            10.pw,
            Expanded(
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.cyan[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'ابحث عن ادوية',
                          // textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      5.pw,
                      const ImageContainer(
                          height: 40,
                          width: 40,
                          image:
                              'assets/pharmacyImages/medicine-removebg-preview.png'),
                    ].reversed.toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
