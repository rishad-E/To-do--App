// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todoapp/utils/alert_button.dart';

class DialogBox extends StatelessWidget {
  final textcontroller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.textcontroller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.green,
      content: Container(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: textcontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'new task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AlertButton(
                  text: "save",
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 15,
                ),
                AlertButton(
                  text: "cancel",
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
