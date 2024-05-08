

import 'package:api_getx/model/to_do_model.dart';
import 'package:api_getx/views/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ShowBottomSheetWidget extends StatelessWidget {
  final TextEditingController txtCtrl;
  final TextEditingController desCtrl;
  final Items? previousTask; // Accept previous task as parameter
  final void Function()? onPressed;

  const ShowBottomSheetWidget({
    Key? key,
    required this.txtCtrl,
    required this.desCtrl,
    this.previousTask, // Initialize previous task parameter
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize text field values with previous task if available
    if (previousTask != null) {
      txtCtrl.text = previousTask!.title ?? ''; // Set title
      desCtrl.text = previousTask!.description ?? ''; // Set description
    }

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.shortestSide,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.remove_circle_outline,
                color: Colors.red,
                size: 24,
              ),
            ),
          ),
          const Text(
            'Add a Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
          ),
          TextFieldWidget(
            txtCtrl: txtCtrl,
            hintText: 'Title',
          ),
          TextFieldWidget(
            txtCtrl: desCtrl,
            hintText: 'Description',
            maxlen: 2,
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                shadowColor: Colors.grey,
              ),
              child: const Text(
                'ADD',
                style: TextStyle(),
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          )
        ],
      ),
    );
  }
}