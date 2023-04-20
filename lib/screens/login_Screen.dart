import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/screens/home_screen.dart';
import 'package:pharmacy/component/widgets/default_button.dart';
import 'package:pharmacy/component/widgets/text_form_field.dart';
import 'package:pharmacy/shared/routing.dart';

import '../controller/get.dart';



class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                150.ph,
                SafeArea(
                  child: Text(
                    'Log In'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 39,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                50.ph,
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
                  onSubmitted: (String? value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  filled: false,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password can not be empty';
                    }
                    return null;
                  },
                  labelText: 'Password',
                  controller: passwordController,
                ),
                60.ph,
                Column(
                  children: [
                    DefaultButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Get.offNamed(HomeRouting.config().path);
                        }
                      },
                      text: 'Log in',
                      fontWeight: FontWeight.bold,
                    ),
                    15.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Text(
                            'Already have an account?',
                            textAlign: TextAlign.right,
                          ),
                        ),
                        5.pw,
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(RegisterRouting.config().path);
                            },
                            child: const Text(
                              'register',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
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
