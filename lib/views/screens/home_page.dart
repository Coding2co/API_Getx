import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/todo_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodoController ctrl = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TO DO ',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Obx(
        () => FutureBuilder(
          future: Future.value(ctrl.isLoading.value),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return   Center(child:CircularProgressIndicator(
                color:Colors.blue,
                strokeAlign: BorderSide.strokeAlignOutside,
                strokeWidth: 6.0,
                backgroundColor: Colors.lightBlue[50],
            
              ));
            } else if (snapshot.hasError) {
              return Container(
                color: Colors.red,
                child:const Text('Error',style: TextStyle(color:Colors.white),),
              );
            } else {
              return ListView.separated(
                itemBuilder: (context,index) { 
                  var todo = ctrl.todoList[index].title;
                  return Container(
                    height: 100.0,
                    padding:const EdgeInsets.all(16.0),
                    child: Text('$todo'),
                  );
                
             }, separatorBuilder:(context,index){ 
              return const Divider(
                thickness: 2.5,
                height: 0.5,
                color:Colors.grey,
              );

              }, itemCount:ctrl.todoList.length,

              );
            }
          },
        ),
      ),
    );
  }
}































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

