import 'package:api_getx/model/to_do_model.dart';

abstract class ApiResponse{
  Future<List<TodoList>?>getTodoList();
  Future <String?> addTodoList(Items task);
  Future <String?> updateTodoList(Items task,String ref);
  Future <String?> deleteTodoList(String ref);

}