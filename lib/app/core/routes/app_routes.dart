import 'package:get/get.dart';
import 'package:todo_list_firebase/app/ui/pages/bridge_page.dart';

import '../../ui/pages/home_page.dart';

import 'routes_navigator.dart';

abstract class Routes {
  static final _appPages = [
    GetPage(
      name: RoutesNavigator.homePage,
      page: () => HomePage(),
    ),
    GetPage(
      name: RoutesNavigator.bridgePage,
      page: () => const BridgePage(),
    ),
  ];

  static List<GetPage<dynamic>> get appPages => _appPages;
}
