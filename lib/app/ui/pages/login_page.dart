import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list_firebase/app/controllers/auth_controller.dart';

import 'package:todo_list_firebase/app/ui/shared/utils/images/app_images.dart';

import '../shared/utils/colors/app_colors.dart';
import '../shared/widgets/auth_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    required this.loginController,
    required this.toggleSignedup,
    super.key,
  });
  final VoidCallback toggleSignedup;
  final AuthController loginController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  AppImages.loginImage,
                  height: 200,
                ),
                //criar um loader enquanto faz o login
                AuthForm(
                  controller: loginController,
                  onClickedSignup: toggleSignedup,
                  userMessage: 'Don\'t have an account ?    ',
                  buttonMessage: 'Sign Up',
                  actionMessage: 'Log In',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
