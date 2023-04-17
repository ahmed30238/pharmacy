import 'package:flutter/material.dart';
import 'package:pharmacy/component/component.dart';
import 'package:pharmacy/ex.dart';
import 'package:pharmacy/screens/home_screen.dart';
import 'package:pharmacy/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
                    defaultButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
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
                              navigateTo(
                                context,
                                RegisterScreen(),
                              );
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
