import 'package:get/get.dart';
import 'package:todo_app_flutter_getx/data/service/home/model/todo_model.dart';

class HomeController extends GetxController {
  var todos =
      <TodoModel>[
        TodoModel(title: 'deneme 1', subTitle: 'acıklama 1'),
        TodoModel(title: 'deneme 1', subTitle: 'acıklama 1'),
        TodoModel(title: 'deneme 1', subTitle: 'acıklama 1'),
        TodoModel(title: 'deneme 1', subTitle: 'acıklama 1'),
        TodoModel(title: 'deneme 1', subTitle: 'acıklama 1'),
        TodoModel(title: 'deneme 1', subTitle: 'acıklama 1'),
      ].obs;
}
