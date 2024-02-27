// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:api_getx/model/to_do_model.dart';
import 'package:api_getx/services/backend/api_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppResponse extends ApiResponse {
  var baseClient = http.Client();
  var baseUrl = Uri.parse('https://api.nstack.in/v1/todos');
  var url = "https://api.nstack.in/v1/todos";

  @override
  Future<List<TodoList>?> getTodoList() async {
    final response = await baseClient.get(baseUrl);

    if (response.statusCode == 200) {
      final jsonString = response.body;

      debugPrint(jsonString);

      try {
        final dynamic jsonData = json.decode(jsonString);
        final TodoList todoItem = TodoList.fromJson(jsonData);
        return [todoItem];
      } catch (e) {
        debugPrint('Error decoding JSON: $e');
        return null;
      }
    }

    return null;
  }

  @override
  Future<String?> addTodoList(Items task) async {
    try {
      var _headers = {
        "Content-type": "application/json",
      };
      var jsonBody = jsonEncode(task);
      final response =
          await baseClient.post(baseUrl, body: jsonBody, headers: _headers);
      if (response.statusCode == 201) {
        return "Succesfully Added Your Task";
      } else {
        return "Error occured";
      }
    } catch (e) {
      debugPrint('Error:$e');
    }
    return null;
  }

  @override
  Future<String?> updateTodoList(Items task, String ref) async {
    try {
        var _headers = {
        "Content-type": "application/json",
      };
      var jsonBody = jsonEncode(task);
      var appurl = Uri.parse('$url/$ref');
      debugPrint(appurl.toString());
      final response = await baseClient.put(appurl, body: jsonBody, headers: _headers);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        return "Updated Successfully";
      } else {
        return "Error occurred";
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
    return null;
  }

  @override
  Future<String?> deleteTodoList(String ref) async {
    try {
      var _headers = {
        "Content-type": "application/json",
      };
      var appUrl = Uri.parse('$url/$ref');
      debugPrint(appUrl.toString());
      var response = await baseClient.delete(appUrl, headers: _headers);
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        return "Deleted Successfully";
      } else {
        return "Error in Deletion";
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
    return null;
  }
}
