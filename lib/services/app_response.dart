import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:to_do_app/models/todo_mddel.dart';
import 'package:to_do_app/services/api_response.dart';
import 'package:http/http.dart' as http;

class AppResponse extends ApiResponse {
  var baseClient = http.Client();
  var baseUrl = Uri.parse('https://jsonplaceholder.typicode.com/todos');

  @override
  Future<List<Todo>?> getTodoList() async {
    List<Todo> todoItems = [];
    var response = await baseClient.get(baseUrl);

    debugPrint('${response.statusCode}');
    
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      for (var i = 0; i < body.length; i++) {
        todoItems.add(Todo.fromJson(body[i]));
      }
        // debugPrint('$todoItems');
      return todoItems;
    }
    return null;
  }
}
