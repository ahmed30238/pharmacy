import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/shared/routing.dart';

import '../../controller/get.dart';
import '../../shared/widgets/default_button.dart';
import '../../shared/widgets/text_form_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Controller controller = Get.find();
  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Form(
          key: _formKey,
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
                    Get.offNamed(LayoutRouting.config().path);
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
                        if (_formKey.currentState!.validate()) {
                          Get.offNamed(LayoutRouting.config().path);
                        }
                      },
                      text: 'Log in',
                      fontWeight: FontWeight.bold,
                    ),
                    15.ph,
                    RichText(
                      text: TextSpan(
                        text: "Already have an account?  ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: 'register',
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  Get.toNamed(RegisterRouting.config().path),
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
