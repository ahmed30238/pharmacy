import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      
      decoration:  InputDecoration(
        
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        hintText: 'ما الذي تبحث عنه؟',
        hintTextDirection: TextDirection.rtl,
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.deepOrange,
      ),
    );
  }
}
