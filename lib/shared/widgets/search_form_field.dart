import 'package:flutter/material.dart';
class SearchFormField extends StatelessWidget {
  const SearchFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 45,
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text(
              'ما الذي تبحث عنه؟',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            filled: true,
            fillColor: Colors.red,
          ),
        ),
      ),
    );
  }
}