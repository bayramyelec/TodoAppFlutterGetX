import 'package:get/instance_manager.dart';
import 'package:todo_app_flutter_getx/views/add_todo/add_todo_controller.dart';
import 'package:todo_app_flutter_getx/views/home/home_controller.dart';

Future getControllers() async {
  Get.create(() => HomeController(), permanent: false);
  Get.create(() => AddTodoController(), permanent: false);

  Get.put(HomeController());
  Get.put(AddTodoController());
}
