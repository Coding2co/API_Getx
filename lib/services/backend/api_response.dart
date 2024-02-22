import 'package:api_getx/model/to_do_model.dart';

abstract class ApiResponse{
  Future<List<TodoList>?>getTodoList();

}