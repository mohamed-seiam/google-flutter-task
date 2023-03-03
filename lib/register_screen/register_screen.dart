import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:goggle_task_flutter/animation_screen/animation_screen.dart';
import 'package:goggle_task_flutter/helper/functions.dart';
import 'package:goggle_task_flutter/widgets/custom_button.dart';
import 'package:goggle_task_flutter/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPassword = true;

  bool isConfirmPassword = true;

  bool isMatching = false;

  String textBasedOnMatching = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.purple,
      //   elevation: 0.0,
      // ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ClipPath(
                clipper: WaveClipperOne(),
                child: Container(
                  height: 250,
                  color: Colors.purple,
                  // ignore: prefer_const_constructors
                  child: Center(
                      child: const Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextField(
                  hintText: 'Full Name',
                  label: 'Full Name',
                  preffix: Icons.person,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Field is required';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextField(
                  hintText: 'Phone',
                  label: 'Phone',
                  preffix: Icons.phone,
                  inputType: TextInputType.phone,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Phone number is required';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextField(
                  hintText: 'Email',
                  label: 'Email',
                  preffix: Icons.email_outlined,
                  validate:Validate.validateEmail,
                ),
              ),
              const SizedBox(
                height: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextField(
                  hintText: 'Password',
                  label: 'Password',
                  controller: passwordController,
                  preffix: Icons.lock,
                  obscureText: isPassword,
                  suffixPress: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  suffix: isPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_rounded,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Password  is required';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextField(
                  onChanged: (data) {
                    if (passwordController.text ==
                        data) {
                      setState(() {
                        isMatching = true;
                          textBasedOnMatching = 'Valid' ;
                          print(textBasedOnMatching.toString());
                      });
                    } else {
                      setState(() {
                        isMatching = false;
                        // textBasedOnMatching = 'No' ;
                      });
                    }
                  },
                   errorText: !isMatching ? '': 'valid',
                  errorStyle: TextStyle(
                    color: isMatching ? Colors.green : Colors.red,
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: isMatching ? Colors.green : Colors.red,
                  )),
                  hintText: 'Confirm Password',
                  label: 'Confirm Password',
                  controller: confirmPasswordController,
                  preffix: Icons.lock,
                  obscureText: isConfirmPassword,
                  suffixPress: () {
                    setState(() {
                      isConfirmPassword = !isConfirmPassword;
                    });
                  },
                  suffix: isConfirmPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_rounded,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Field is  required';
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                          textBasedOnMatching = 'Not Matching';
                          return textBasedOnMatching ;
                      }
                    // else if (passwordController.text == confirmPasswordController.text)
                    // {
                    //   textBasedOnMatching = 'valid';
                    //   return textBasedOnMatching;
                    // }
                    else
                    {
                      return null;
                    }
                  },

                ),
              ),
              const SizedBox(
                height: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomButton(
                  text: 'Register',
                  color: Colors.purple,
                  colorText: Colors.white,
                ),
              ),
              const SizedBox(
                height: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomButton(
                  text: 'Login',
                  color: Colors.white,
                  colorText: Colors.purple,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Future.delayed(const Duration(seconds: 1),()
                      {
                        Navigator.pushNamed(context, AnimationScreen.id);
                      });

                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
