import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_firebase/app/ui/pages/sign_up_page.dart';

import '../../controllers/auth_controller.dart';
import 'login_page.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => authController.isLogin.value
          ? LoginPage(
              toggleSignedup: authController.toggle,
              loginController: authController,
            )
          : SignUpPage(
              toggleLogin: authController.toggle,
              signUpController: authController,
            ),
    );
  }
}
