import 'dart:convert';

import 'package:api_getx/model/to_do_model.dart';
import 'package:api_getx/services/backend/api_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppResponse extends ApiResponse {
  var baseClient = http.Client();
  var baseUrl = Uri.parse('https://api.nstack.in/v1/todos?page=1&limit=10');

  @override
  Future<List<TodoList>?> getTodoList() async {
    final response = await baseClient.get(baseUrl);

 

    if (response.statusCode == 200) {
      
      final jsonString = response.body;

      debugPrint(jsonString);
     
      
      try {
        final dynamic jsonData = json.decode(jsonString);

          final TodoList todoItem = TodoList.fromJson(jsonData);

//           var todoList = TodoList.fromJson(jsonData);
// if (todoList.dataList != null) {
//   for (var data in todoList.dataList!) {
//     print('Todo Description: ${data.description}');
//   }
// } else {
//   print('No data found in the todoList');
// }
  
          return [
            todoItem
          ]; 
        
      } catch (e) {
        debugPrint('Error decoding JSON: $e');
        return null;
      }
    }

    return null;
  }
}


//    Future<List<TodoList>?>getTodoList() async{
//     // List<TodoList>todoItems=[];
//      var response = await baseClient.get(baseUrl);

//      debugPrint('${response.statusCode}');

//      if(response.statusCode == 200){
//       var jsonString = json.decode(response.body);
    

//        List<TodoList> todoItems = jsonString.values.map<TodoList>((json) => TodoList.fromJson(json)).toList();
//       debugPrint(jsonString);
//       return todoItems;
//      }
  
//     throw UnimplementedError();
//   }
  




  // for(var i=0;i<jsonString.length;i++){
      //      todoItems.add(TodoList.fromJson(jsonString[i]));
      // }
      //  List<TodoList> todoItems =
      //
      // jsonString.map<TodoList>((json) => TodoList.fromJson(json)).toList();








//       try {
//       final List<TodoList> todoItems = json.decode(jsonString).map<TodoList>((json) => TodoList.fromJson(json)).toList();

//       debugPrint('none');

//        return todoItems;
     
//     } catch (e) {
//       debugPrint('Error decoding JSON: $e');
      
//     }
//   }
 
//     return null;
// }