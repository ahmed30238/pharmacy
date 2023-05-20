import 'package:flutter/material.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      
      decoration: const InputDecoration(
        
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        hintText: 'ما الذي تبحث عنه؟',
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyle(color: Colors.white),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.deepOrange,
      ),
    );
  }
}
