
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/views/screens/home_page.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.amber[200],
      appBarTheme:const  AppBarTheme(
        elevation: 10.0,
        centerTitle: true,
      ),
     ),
     home:HomePage()
    );
  }
}