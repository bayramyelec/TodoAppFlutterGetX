import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_app_flutter_getx/bindings/app_binding.dart';
import 'package:todo_app_flutter_getx/routes/app_routes.dart';
import 'package:todo_app_flutter_getx/views/add_todo_page.dart';
import 'package:todo_app_flutter_getx/views/completed_todos_page.dart';
import 'package:todo_app_flutter_getx/views/home_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.addTodo,
      page: () => AddTodoPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.completedTodos,
      page: () => CompletedTodosPage(),
      binding: AppBinding(),
    ),
  ];
}
