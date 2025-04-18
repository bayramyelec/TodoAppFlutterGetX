import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app_flutter_getx/data/src/colors.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  static const String routeName = '/views/add_todo/add_todo_page';

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
          TextField(decoration: InputDecoration(hintText: 'Title')),
          TextField(decoration: InputDecoration(hintText: 'Detail')),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
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
