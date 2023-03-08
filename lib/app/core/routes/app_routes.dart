import 'package:get/get.dart';

import '../../ui/pages/login_page.dart';
import 'routes_navigator.dart';

abstract class Routes {
  static final _appPages = [
    GetPage(
      name: RoutesNavigator.login,
      page: () => const LoginPage(),
    )
  ];

  static List<GetPage<dynamic>> get appPages => _appPages;
}
