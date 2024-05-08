import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController txtCtrl;
  final String? hintText;
  final int? maxlen;
  // final String task;
  const TextFieldWidget({super.key,required this.txtCtrl, this.hintText, this.maxlen});
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width* 0.9,
      child: TextField(  
           maxLines: maxlen,
           controller: txtCtrl,
            decoration:  InputDecoration(
              border: const OutlineInputBorder(),
              hintText:hintText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            
      ),
    );
  }
}