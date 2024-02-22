// ignore_for_file: must_be_immutable

import 'package:api_getx/controller/to_do_controller.dart';
import 'package:api_getx/views/widgets/listTile_widget.dart';
// import 'package:api_getx/views/widgets/listTile.dart';
import 'package:flutter/foundation.dart';
// import 'package:api_getx/views/widgets/listTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
TodoController ctrl = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    final TextEditingController crtl = TextEditingController();
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
      body:Obx(
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
                  style:const TextStyle(color: Colors.white),
                ),
              );
            } else {
               return ListView.builder(
                  itemCount: ctrl.todoItems.length,
                  itemBuilder: (context, index) {
                    var todo = ctrl.todoItems[index].data!.title;
                    if (kDebugMode) {
                      print(todo);
                    }
                return Container(
                padding:const EdgeInsets.all(10.0),
                child: ListTileWidget(
                  sNo: '${ctrl.todoItems.length}',
                  task:'$todo',
                  listTileCtrl: crtl,
                ));
          },
          );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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


















// // return ListView(
// //                 itemBuilder: (context, index) {
// //                   var todo = ctrl.todoItems[index];
// //                   return Container(
// //                     height: 100.0,
// //                     padding:const EdgeInsets.all(16.0),
// //                     child: Text('${todo.title}'), // Display todo title, adjust as needed
// //                   );
// //                 },
// //                 itemCount: ctrl.todoItems.length,
// //               );











    



// import 'package:api_getx/controller/to_do_controller.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:to_do_app/controllers/todo_controller.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   final TodoController ctrl = Get.put(TodoController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'TO DO ',
//           style: TextStyle(
//             fontSize: 22.0,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//       body: Obx(
//         () => FutureBuilder(
//           future: Future.value(ctrl.isLoading.value),
//           builder: (context, snapshot) {

//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return   Center(child:CircularProgressIndicator(
//                 color:Colors.blue,
//                 strokeAlign: BorderSide.strokeAlignOutside,
//                 strokeWidth: 6.0,
//                 backgroundColor: Colors.lightBlue[50],
            
//               ));
//             } else if (snapshot.hasError) {
//               return Container(
//                 color: Colors.red,
//                 child:const Text('Error',style: TextStyle(color:Colors.white),),
//               );
//             } else {
//               return ListView.separated(
//                 itemBuilder: (context,index) { 
//                   var todo = ctrl.todoItems[index].data?.description;
//                   if(kDebugMode){
//                     print(
//                    todo
//                     );
//                   }
//                   return Container(
//                     height: 100.0,
//                     padding:const EdgeInsets.all(16.0),
//                     child: Text('$todo'),
//                   );
                
//              }, separatorBuilder:(context,index){ 
//               return const Divider(
//                 thickness: 2.5,
//                 height: 0.5,
//                 color:Colors.grey,
//               );

//               }, itemCount:ctrl.todoItems.length,

//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }









// import 'package:api_getx/controller/to_do_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';

// class HomeScreen extends StatelessWidget {
  
//  const HomeScreen({super.key,});


 

//   @override
//   Widget build(BuildContext context) {
//      final TodoController ctrl = Get.put(TodoController());
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'TO DO ',
//           style: TextStyle(
//             fontSize: 22.0,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//       body: Obx(
//         () => FutureBuilder(
//           future: Future.value(ctrl.isLoading.value),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.blue,
//                   strokeWidth: 6.0,
//                   backgroundColor: Colors.lightBlue[50],
//                 ),
//               );
//             } else if (snapshot.hasError) {
//               return Container(
//                 color: Colors.red,
//                 child: const Text('Error', style: TextStyle(color: Colors.white)),
//               );
//             } else {
//               return ListView.separated(
//                 itemBuilder: (context, index) { 

//                   var todoItem = ctrl.todoItems[index];
//                   var todoDescription = todoItem.data!.description; // Access description from Data object
//                   debugPrint("Todo Description: $todoDescription");
//                   return Container(
//                     height: 100.0,
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text('$todoDescription'),
//                   );
//                 },
//                 separatorBuilder: (context, index) { 
//                   return const Divider(
//                     thickness: 2.5,
//                     height: 0.5,
//                     color: Colors.grey,
//                   );
//                 },
//                 itemCount: ctrl.todoItems.length,
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }


































































































































































































// class HomePage extends StatelessWidget {
//   final TodoController ctrl = Get.put(TodoController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'TO DO ',
//           style: TextStyle(
//             fontSize: 22.0,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//       body: Obx(
//         () => FutureBuilder(
//           future: Future.value(ctrl.isLoading.value), // Use isLoading to track loading state
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.blue,
//                   strokeWidth: 6.0,
//                   backgroundColor: Colors.lightBlue[50],
//                 ),
//               );
//             } else if (snapshot.hasError) {
//               return Container(
//                 color: Colors.red,
//                 child: Text(
//                   'Error: ${snapshot.error}',
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               );
//             } else {
//               return ListView.separated(
//                 itemBuilder: (context, index) {
//                   // var todo = ctrl.todoList[index];
//                   return Container(
//                     height: 100.0,
//                     padding: const EdgeInsets.all(16.0),
//                     child: const Text('Success'), // Display todo title, adjust as needed
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return const Divider(
//                     thickness: 0.5,
//                     height: 0.5,
//                     color: Colors.grey,
//                   );
//                 },
//                 itemCount: ctrl.todoList.length,
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }




//this is called the succcessfully because I  can the troubleshooting of the app.This is called great when we done with our resource like chatgpt .AndhraPradesh they pull you down we should be able be yell .in a difficult challenging . We need it to empolyee which these postive and competetive .as a team member . Questuioon [rolenn soloving appy to any industrio.it not any problene ahave wahata is sthe problem and find solutin anf analayse the gather the solution and thake the best solution .so thetyccd abcdefghijklmnopqrstuvwxyz

