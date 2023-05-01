import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_app/widgets/text_input_field.dart';

import '../resources/auth_methods.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _passwordContoller = TextEditingController();
  final TextEditingController _bioContoller = TextEditingController();
  final TextEditingController _usernameContoller = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailContoller.dispose();
    _passwordContoller.dispose();
    _bioContoller.dispose();
    _usernameContoller.dispose();
  }

  // ignore: non_constant_identifier_names
  void SelectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailContoller.text,
        password: _passwordContoller.text,
        bio: _bioContoller.text,
        username: _usernameContoller.text,
        file: _image!);
    setState(() {
      _isLoading = false;
    });

    if (res != 'Signed up success') {
      showSnackBar(res as BuildContext, context as String);
    } else {}
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
              Flexible(
                flex: 2,
                child: Container(),
              ),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                // ignore: deprecated_member_use
                color: primaryColor, height: 64,
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://media.licdn.com/dms/image/C4E03AQE1PuA8SVwFqA/profile-displayphoto-shrink_800_800/0/1629188894527?e=2147483647&v=beta&t=pgV3Zx9pUaSxTp9u1aT3kpD7zk_KQo8krFgpRgy_XaI'),
                        ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: SelectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: blueColor,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldInput(
                hintText: 'Enter your Username',
                textInputType: TextInputType.text,
                textEditingController: _usernameContoller,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldInput(
                hintText: 'Enter your Email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailContoller,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldInput(
                hintText: 'Enter your Pasword',
                textInputType: TextInputType.emailAddress,
                textEditingController: _passwordContoller,
                isPass: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldInput(
                hintText: 'Enter your Bio',
                textInputType: TextInputType.text,
                textEditingController: _bioContoller,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: signUpUser,
                child: Container(
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
                  child: _isLoading ?
                  const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )
                  // ignore: sort_child_properties_last
                  : const Text('Sign Up'),
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
                    child: const Text('Already have an account?'),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: const Text(
                        'Log In',
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
