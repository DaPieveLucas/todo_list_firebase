import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../controllers/auth_controller.dart';
import '../shared/utils/colors/app_colors.dart';
import '../shared/utils/images/app_images.dart';
import '../shared/widgets/login_page_widgets/auth_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    required this.signUpController,
    required this.toggleLogin,
    super.key,
  });

  final AuthController signUpController;
  final VoidCallback toggleLogin;

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

                //criar um loader enquanto faz o signUp
                AuthForm(
                  controller: signUpController,
                  onClickedSignup: toggleLogin,
                  actionMessage: 'Sign Up',
                  buttonMessage: 'Log In',
                  userMessage: 'Already have an account ?   ',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //resolver depois esse negócio que não funciona

  void showInSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('snack'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'ACTION',
          onPressed: () {},
        ),
      ),
    );
  }
}
