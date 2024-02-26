
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Icon appIcon;
  final Color? trailingButtonColor;
  final TextEditingController elevatedButtonCtrl;

  const ElevatedButtonWidget({
    super.key,
    required this.appIcon,
    required this.elevatedButtonCtrl,
    this.trailingButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(10, 34),
        backgroundColor: trailingButtonColor ?? Colors.white,
      ),
      child: appIcon,
    );
  }
}




















