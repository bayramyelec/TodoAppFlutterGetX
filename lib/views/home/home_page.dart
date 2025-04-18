import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app_flutter_getx/data/src/colors.dart';
import 'package:todo_app_flutter_getx/views/add_todo/add_todo_page.dart';
import 'package:todo_app_flutter_getx/views/home/home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  static const String routeName = '/views/home/home_page';

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
          onPressed: () {},
          icon: Icon(Icons.date_range_sharp),
          color: HexColor(appbarColor),
        ),
      ],
      backgroundColor: HexColor(mainColor),
    );
  }

  Widget _buildBody() {
    return Obx(
      () => ListView.builder(
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
    final todo = controller.todos[index];
    return Card(
      shadowColor: Colors.black,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: HexColor(mainColor),
                    fontSize: 16,
                  ),
                ),
                Text(
                  todo.subTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.edit, size: 20, color: HexColor(mainColor)),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.delete, size: 20, color: HexColor(mainColor)),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.check_circle_outline,
                  size: 20,
                  color: HexColor(mainColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goToAddTaskPage() {
    Get.toNamed(AddTodoPage.routeName);
  }
}
