


import 'package:api_getx/views/widgets/elevated_button.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String? sNo;
  final String task;
  final VoidCallback? onDeletePressed;
   final VoidCallback? onEditPressed;
  final Color? trailingButtonColor;
  final TextEditingController? listTileCtrl;

  ListTileWidget(
      {super.key,
       this.sNo,
     required this.task,
     this.onEditPressed,
     this.onDeletePressed,
     this.listTileCtrl,
      this.trailingButtonColor});

  final TextEditingController editCtrl = TextEditingController();
  final TextEditingController deleteCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[800]!,
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(flex: 0, child: Text('$sNo',style:TextStyle(
             fontSize: 22.0,
             color: Colors.blue[300],
             fontWeight: FontWeight.w600,
          ),)),
          const SizedBox(width: 12.0),
          Expanded(
              flex: 3,
              child: Text(
                task,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600),
              )),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: 0,
            child: ElevatedButtonWidget(
              elevatedButtonCtrl: editCtrl,
              onPressed: onEditPressed,
              appIcon: const Icon(Icons.edit, color: Colors.black,size: 17.0, weight: 40,),
              trailingButtonColor: Colors.amber[200],
            ),
          ),
          const SizedBox(
            width: 7.0,
          ),
          Expanded(
            flex: 0,
            child: ElevatedButtonWidget(
              elevatedButtonCtrl: deleteCtrl,
              onPressed: onDeletePressed,
              appIcon: const Icon(
                Icons.delete,
                size: 17.0,
                weight: 40,
                color: Colors.black,
              ),
              trailingButtonColor: Colors.red[400],
            ),
          ),
        ],
      ),
    );
  }
}





