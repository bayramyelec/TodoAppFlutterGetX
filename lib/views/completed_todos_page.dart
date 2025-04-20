import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app_flutter_getx/controllers/todo_controllers.dart';
import 'package:todo_app_flutter_getx/data/src/colors.dart';

class CompletedTodosPage extends GetView<TodoControllers> {
  const CompletedTodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buidAppBar(),
      body: Obx(
        () =>
            controller.todos.where((task) => task.isCompleted).isEmpty
                ? const Center(
                  child: Text(
                    'No completed todo.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
                : ListView.builder(
                  itemCount:
                      controller.todos.where((task) => task.isCompleted).length,
                  itemBuilder: (context, index) {
                    final task = controller.todos
                        .where((task) => task.isCompleted)
                        .elementAt(index);
                    return ListTile(
                      title: Text(task.title),
                      subtitle: Text(task.description),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => controller.deleteTask(task.id),
                      ),
                    );
                  },
                ),
      ),
    );
  }

  AppBar _buidAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => _goToBack(),
        icon: Icon(Icons.arrow_back, color: HexColor(appbarColor)),
      ),
      title: Text(
        'Completed Task',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: HexColor(appbarColor),
        ),
      ),
      centerTitle: false,
      backgroundColor: HexColor(mainColor),
    );
  }

  void _goToBack() {
    Get.back();
  }
}
