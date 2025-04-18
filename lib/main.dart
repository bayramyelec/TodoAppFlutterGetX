import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:todo_app_flutter_getx/data/get_controllers.dart';
import 'package:todo_app_flutter_getx/data/routing/get_pages.dart';
import 'package:todo_app_flutter_getx/views/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> main() async {
    await getControllers();
  }

  @override
  Widget build(BuildContext context) {
    main();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      home: HomePage(),
    );
  }
}
