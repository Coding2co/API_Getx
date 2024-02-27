

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController txtCtrl;
  // final String task;
  const TextFieldWidget({super.key,required this.txtCtrl});
  

  @override
  Widget build(BuildContext context) {
    return TextField(
         controller: txtCtrl,
          
    );
  }
}