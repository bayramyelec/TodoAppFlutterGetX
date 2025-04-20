import 'package:get/get.dart';
import 'package:todo_app_flutter_getx/models/todo_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';

class TodoControllers extends GetxController {
  final todos = <Task>[].obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadTodo();
  }

  void loadTodo() {
    final todoList = storage.read<List>('todos') ?? [];
    todos.assignAll(
      todoList.map((e) => Task.fromJson(Map<String, dynamic>.from(e))).toList(),
    );
  }

  void addTodo(String title, String description) {
    final todo = Task(id: Uuid().v4(), title: title, description: description);
    todos.add(todo);
    saveTask();
  }

  void updateTodo(String id, String title, String description) {
    final index = todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      todos[index] = Task(id: id, title: title);
      saveTask();
    }
  }

  void deleteTask(String id) {
    todos.removeWhere((todo) => todo.id == id);
    saveTask();
  }

  void toggleTodoCompletion(String id) {
    final index = todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      todos[index].isCompleted = !todos[index].isCompleted;
      todos[index] = todos[index];
      saveTask();
    }
  }

  void saveTask() {
    storage.write('todos', todos.map((todo) => todo.toJson()).toList());
  }
}
