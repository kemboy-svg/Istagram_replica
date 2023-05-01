import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app/resources/auth_methods.dart';
import 'package:instagram_app/utils/colors.dart';
import 'package:instagram_app/utils/utils.dart';
import 'package:instagram_app/widgets/text_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _passwordContoller = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailContoller.dispose();
    _passwordContoller.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().LoginUser(
       email: _emailContoller.text,
       password: _passwordContoller.text
       );

    if (res == 'success') {
    setState(() {
      _isLoading = false;
    });
    } 
    
    else {
      // ignore: use_build_context_synchronously
     
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                // ignore: deprecated_member_use
                color: primaryColor, height: 64,
              ),
              const SizedBox(
                height: 64,
              ),
              TextFieldInput(
                hintText: 'Enter your Email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailContoller,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your Pasword',
                textInputType: TextInputType.emailAddress,
                textEditingController: _passwordContoller,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: loginUser,
                child: Container(
                  // ignore: sort_child_properties_last
                  child: _isLoading ?
                  const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )

                  :const Text('Login'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      color: blueColor),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(flex: 2, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text('Dont have an account?'),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
