import 'package:flutter/material.dart';
import 'package:pharmacy/component/component.dart';
import 'package:pharmacy/ex.dart';


class CardsController extends StatelessWidget {
  const CardsController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color.fromARGB(255, 64, 236, 239)
                                  .withOpacity(.9),
                              const Color.fromARGB(255, 178, 242, 246)
                                  .withOpacity(.9),
                            ],
                          ),
                        ),
                        width: double.infinity,
                      ),
                    ),
                    const Expanded(
                      flex: 7,
                      child: Center(
                        child: Text(
                          'ادارة البطاقات',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            10.pw,
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: imageContainer(
                    90,
                    90,
                    'assets/pharmacyImages/A-removebg-preview.png',
                  ),
                ),
              ),
            ),
            10.pw,
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: SizedBox(
                    height: 90,
                    width: 90,
                    child: Image(
                      image: AssetImage(
                          'assets/pharmacyImages/allianz-removebg-preview.png'),
                    ),
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


