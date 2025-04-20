import 'package:get/get.dart';
import 'package:todo_app_flutter_getx/controllers/todo_controllers.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoControllers>(() => TodoControllers());
  }
}
