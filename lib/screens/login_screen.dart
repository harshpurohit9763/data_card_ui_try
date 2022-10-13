import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_data_card/widget/txt_field.dart';

import '../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Image.asset(
                  'assets/1.png',
                  height: 200,
                ),
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
                Container(
                  width: double.infinity,
                  color: blueColor,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text("Login"),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Center(
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('New User?'),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                  ),
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
