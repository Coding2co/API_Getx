import 'dart:convert';

import 'package:api_getx/model/to_do_model.dart';
import 'package:api_getx/services/backend/api_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppResponse extends ApiResponse {
  var baseClient = http.Client();
  var baseUrl = Uri.parse('https://api.nstack.in/v1/todos');

  @override
  Future<List<TodoList>?> getTodoList() async {
    final response = await baseClient.get(baseUrl);

    if (response.statusCode == 200) {
      final jsonString = response.body;

      debugPrint(jsonString);

      try {
        final dynamic jsonData = json.decode(jsonString);
        final TodoList todoItem = TodoList.fromJson(jsonData);
        //  debugPrint(jsonData.items.title);
        return [todoItem];
      } catch (e) {
        debugPrint('Error decoding JSON: $e');
        return null;
      }
    }

    return null;
  }
}
