import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/shared/routing.dart';

import '../../controller/get.dart';
import '../../shared/widgets/default_button.dart';
import '../../shared/widgets/text_form_field.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {

  
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  void dispose() {
    formKey.currentState?.dispose();
    super.dispose();
  }
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                30.ph,
                SafeArea(
                  child: Text(
                    'Register Now'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 39,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                50.ph,
                DefaultTextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Name can not be empty';
                    }
                    return null;
                  },
                  labelText: 'Name',
                  border: const UnderlineInputBorder(),
                  controller: nameController,
                ),
                30.ph,
                DefaultTextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Email can not be empty';
                    }
                    return null;
                  },
                  labelText: 'Email',
                  border: const UnderlineInputBorder(),
                  controller: emailController,
                ),
                30.ph,
                DefaultTextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'phone can not be empty';
                    }
                    return null;
                  },
                  labelText: 'Phone Number',
                  border: const UnderlineInputBorder(),
                  controller: phoneController,
                ),
                30.ph,
                DefaultTextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password can not be empty';
                    }
                    return null;
                  },
                  labelText: 'Password',
                  border: const UnderlineInputBorder(),
                  controller: passwordController,
                ),
                30.ph,
                DefaultTextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password can not be empty';
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      return 'password does not match';
                    }
                    return null;
                  },
                  labelText: 'Confirm Password',
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  controller: confirmPasswordController,
                ),
                30.ph,
                Column(
                  children: [
                    DefaultButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Get.offNamed(LayoutRouting.config().path);
                        }
                      },
                      text: 'Register',
                      fontWeight: FontWeight.bold,
                    ),
                    15.ph,
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account?  ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: 'login now'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => Get.toNamed(LoginRouting.config().path),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
