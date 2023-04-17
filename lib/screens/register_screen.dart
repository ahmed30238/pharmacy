import 'package:flutter/material.dart';

import 'package:pharmacy/component/component.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/screens/home_screen.dart';
import 'package:pharmacy/screens/login_Screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                defaultTextFormField(
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
                defaultTextFormField(
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
                defaultTextFormField(
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
                defaultTextFormField(
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
                defaultTextFormField(
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
                    defaultButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          navigateAndFinish(
                            context,
                            const HomeScreen(),
                          );
                        }
                      },
                      text: 'Register',
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
                              navigateTo(
                                context,
                                LoginScreen(),
                              );
                            },
                            child:  Text(
                              'login now'.toUpperCase(),
                              textAlign: TextAlign.left,
                              style:const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
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
