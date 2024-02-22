import 'package:to_do_app/models/todo_mddel.dart';

abstract class ApiResponse {
  Future<List<Todo>?> getTodoList();
}
