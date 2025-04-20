import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app_flutter_getx/controllers/todo_controllers.dart';
import 'package:todo_app_flutter_getx/data/src/colors.dart';

class AddTodoPage extends GetWidget<TodoControllers> {
  AddTodoPage({super.key});

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buidAppBar(), body: _buildBody());
  }

  AppBar _buidAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => _goToBack(),
        icon: Icon(Icons.arrow_back, color: HexColor(appbarColor)),
      ),
      title: Text(
        'Add Task',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: HexColor(appbarColor),
        ),
      ),
      centerTitle: false,
      backgroundColor: HexColor(mainColor),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        spacing: 10,
        children: [
          SizedBox(height: 30),
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: subtitleController,
            decoration: InputDecoration(hintText: 'Detail'),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty &&
                    subtitleController.text.isEmpty) {
                  Get.snackbar(
                    'Hata',
                    'Alanlar boş olamaz',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }
                controller.addTodo(
                  titleController.text,
                  subtitleController.text,
                );
                _goToBack();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor(mainColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'ADD',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _goToBack() {
    Get.back();
  }
}
