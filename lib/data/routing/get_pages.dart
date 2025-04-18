import 'package:get/get.dart';
import 'package:todo_app_flutter_getx/views/add_todo/add_todo_page.dart';
import 'package:todo_app_flutter_getx/views/home/home_page.dart';

List<GetPage> getPages = [
  GetPage(name: HomePage.routeName, page: () => HomePage()),
  GetPage(name: AddTodoPage.routeName, page: () => AddTodoPage()),
];
