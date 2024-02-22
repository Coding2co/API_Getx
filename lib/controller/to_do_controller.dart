


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
       debugPrint("$todoItem");
  }
  finally{
   isLoading(false);
  }

  return null;

}
  
     
    
  
  


}



