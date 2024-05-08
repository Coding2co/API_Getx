import 'package:api_getx/model/to_do_model.dart';
import 'package:api_getx/services/backend/app_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController{

  var isLoading = true.obs;
  var todoItems = <TodoList>[].obs;
  AppResponse app = AppResponse();

  @override
  void onInit(){
    fetchTodo();
    super.onInit();
  }

Future fetchTodo()async{

  try{
    isLoading(true);
    var todoItem = await app.getTodoList();
     todoItems.value = todoItem ?? [];
     debugPrint("Return list :$todoItem");
  }
  finally{
   isLoading(false);
  }

  return null;

}
  
 Future <String?> addTodo(Items addItem) async{
  try {
      isLoading(true);
      var response = await app.addTodoList(addItem);
      await fetchTodo();
      return response;
    } finally {
      isLoading(false);
    }
  
 }

 Future <String?> updateTodo(Items updateItem,String refId) async{
  try {
      isLoading(true);
      var response = await app.updateTodoList(updateItem, refId);
      await fetchTodo();
      return response;
    } finally {
      isLoading(false);
    }
 }
    
Future <String?> deletedToddo(String refId) async{

   try {
      isLoading(true);
      var response = await app.deleteTodoList(refId);
      await fetchTodo();
      return response;
    } finally {
      isLoading(false);
    }
}
  


}


