import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_firebase/app/core/routes/app_routes.dart';
import 'package:todo_list_firebase/app/core/routes/routes_navigator.dart';
import 'package:todo_list_firebase/app/ui/shared/widgets/snack_bar_message.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: Utils.instance.scaffoldKey,
      debugShowCheckedModeBanner: false,
      title: 'Todo list with firebase',
      getPages: Routes.appPages,
      initialRoute: RoutesNavigator.bridgePage,
    );
  }
}
