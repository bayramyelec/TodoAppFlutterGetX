import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app_flutter_getx/controllers/todo_controllers.dart';
import 'package:todo_app_flutter_getx/data/src/colors.dart';
import 'package:todo_app_flutter_getx/routes/app_routes.dart';

class HomePage extends GetWidget<TodoControllers> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buidAppBar(),
      body: _buildBody(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () => _goToAddTaskPage(),
      backgroundColor: HexColor(mainColor),
      shape: CircleBorder(),
      child: Icon(Icons.add, color: Colors.white),
    );
  }

  AppBar _buidAppBar() {
    return AppBar(
      title: Text(
        'TODO APP',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: HexColor(appbarColor),
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed(AppRoutes.completedTodos);
          },
          icon: Icon(Icons.checklist),
          color: HexColor(appbarColor),
        ),
      ],
      backgroundColor: HexColor(mainColor),
    );
  }

  Widget _buildBody() {
    return Obx(
      () =>
          controller.todos.isEmpty
              ? Center(
                child: Text(
                  'Todo not found.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
              : ListView.builder(
                itemCount: controller.todos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    child: _buildListTile(index),
                  );
                },
              ),
    );
  }

  Widget _buildListTile(int index) {
    return Card(
      shadowColor: Colors.black,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.todos[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: HexColor(mainColor),
                    fontSize: 16,
                  ),
                ),
                Text(
                  controller.todos[index].description,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                controller.deleteTask(controller.todos[index].id);
              },
              icon: Icon(Icons.delete, size: 20, color: HexColor(mainColor)),
            ),
            Checkbox(
              value: controller.todos[index].isCompleted,
              onChanged:
                  (_) => controller.toggleTodoCompletion(
                    controller.todos[index].id,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _goToAddTaskPage() {
    Get.toNamed(AppRoutes.addTodo);
  }
}
