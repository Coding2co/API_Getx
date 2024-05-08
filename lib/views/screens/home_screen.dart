// ignore_for_file: must_be_immutable

import 'package:api_getx/controller/to_do_controller.dart';
import 'package:api_getx/model/to_do_model.dart';
import 'package:api_getx/views/widgets/listtile_widget.dart';
import 'package:api_getx/views/widgets/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TodoController ctrl = Get.put(TodoController());
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Todo App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w900,
          ),
        ),
        elevation: 10.0,
      ),
      body: Obx(
        () => FutureBuilder(
            future: Future.value(ctrl.isLoading.value),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 6.0,
                    backgroundColor: Colors.lightBlue[50],
                  ),
                );
              } else if (snapshot.hasError) {
                return Container(
                  color: Colors.red,
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: ctrl.todoItems.length,
                  itemBuilder: (context, index) {
                    var todoList = ctrl.todoItems[index];
                    return Column(
                      children: todoList.items!.map((item) {
                        return ListTileWidget(
                          onDeletePressed: () {
                            var refId = item.sId;
                            ctrl.deletedToddo(refId.toString());
                            //  debugPrint(refId);
                          },
                          onEditPressed: () {
                            // var refId = item.sId;
                            // var updateItem = Items(
                            //   title: "Updated element",
                            //   description: "Successfully updated",
                            //   isCompleted: true,
                            // );
                            // ctrl.updateTodo(updateItem, refId.toString());
                            _showUpdatedBottomSheet(context, item);
                          },
                          sNo: "#",
                          task: item.title ?? 'No title',
                        );
                      }).toList(),
                    );
                  },
                );
              }
            }),
      ),
     floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(context,);
            },         
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          size: 32.0,
          weight: 22.0,
        ),
      ),
    );
  }
}


void _showBottomSheet(BuildContext context) {
   final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();
  TodoController todoctrl = Get.put(TodoController());
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ShowBottomSheetWidget(
    
        txtCtrl:titleCtrl,
        desCtrl: descriptionCtrl,
        onPressed: (){
          var addTask = Items(
            title: titleCtrl.text,
            description: descriptionCtrl.text,
            isCompleted: false,
          );
         todoctrl.addTodo(addTask);
          Get.back();
        },
      );
    },
  );
}

void _showUpdatedBottomSheet(context,Items item){

  showModalBottomSheet(context: context, 
  builder: (BuildContext context) {
    final TextEditingController editTitleCtrl = TextEditingController() ;
    final TextEditingController editDescriptionCtrl = TextEditingController();
    final TodoController todo = Get.put(TodoController());
    return ShowBottomSheetWidget(
      previousTask: item,
      txtCtrl: editTitleCtrl, 
      desCtrl: editDescriptionCtrl, 
      onPressed: (){
        var refId = item.sId;
        var updateItem = Items(
          title: item.title,
          sId: item.sId,
          description: item.description,
          isCompleted: false
        );
        todo.updateTodo(updateItem, refId!);
      },
      );
  }
  
  );
}