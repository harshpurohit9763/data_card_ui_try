import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_data_card/utils/utils.dart';
import 'package:one_data_card/resources/authentication.dart';
import 'package:one_data_card/screens/login_screen.dart';
import 'package:one_data_card/widget/txt_field.dart';

import '../utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _middleController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  Uint8List? image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstController.dispose();
    _middleController.dispose();
    _lastController.dispose();
    _phoneNumberController.dispose();
  }

  selectImage() async {
    Uint8List selectedImage = await pickImage(ImageSource.camera);

    setState(() {
      image = selectedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 1,
                ),
                Stack(children: [
                  Image.asset(
                    'assets/1.png',
                    height: 200,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {
                        selectImage;
                      },
                      icon: Icon(Icons.add_a_photo),
                    ),
                  ),
                ]),
                TextFieldInput(
                  textEditingController: _emailController,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Enter your Email Address',
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFieldInput(
                  textEditingController: _passwordController,
                  textInputType: TextInputType.text,
                  hintText: 'Enter Password',
                  isPass: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFieldInput(
                  textEditingController: _firstController,
                  textInputType: TextInputType.text,
                  hintText: 'First Name',
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFieldInput(
                  textEditingController: _middleController,
                  textInputType: TextInputType.text,
                  hintText: 'Middle Name',
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFieldInput(
                  textEditingController: _lastController,
                  textInputType: TextInputType.text,
                  hintText: 'Last Name',
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFieldInput(
                  textEditingController: _phoneNumberController,
                  textInputType: TextInputType.text,
                  hintText: 'Phone Number',
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () async {
                    String res = await AuthMethod().signUpUser(
                        email: _emailController.text,
                        password: _passwordController.text,
                        firstName: _firstController.text,
                        middleName: _middleController.text,
                        lastName: _lastController.text,
                        phoneNumber: _phoneNumberController.text,
                        file: image!);
                    print(res);
                  },
                  child: Container(
                    child: Text("Sign Up"),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      color: blueColor,
                    ),
                  ),
                ),
                Flexible(
                  child: Container(),
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text("Already have an account?"),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: const Text(
                          "Login",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
