
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:to_do_app/models/todo_mddel.dart';
import 'package:to_do_app/services/App_response.dart';

class TodoController extends GetxController {
  var isLoading = true.obs;
  var todoList = <Todo>[].obs;
  AppResponse app = AppResponse();
     
  @override
  void onInit() {
    fetchTodoList();
    super.onInit();
  }

  Future<void> fetchTodoList() async {
    try {
      isLoading(true);
      var todoItem = await app.getTodoList();
      todoList.value = todoItem ?? []; 
      debugPrint('hshsh:$todoItem');
    } finally {
      isLoading(false);
    }
  }
}