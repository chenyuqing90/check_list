import 'package:flutter/material.dart';

class EnterNewHabit extends StatelessWidget{
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final String hintText;

  const EnterNewHabit(
      {
        super.key,
        required this.onSave,
        required this.onCancel,
        required this.controller,
        required this.hintText,
      });

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.black87,
      content: TextField(
        controller: controller,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70)
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white70)
          ),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: onCancel,
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
        ),
        MaterialButton(
          onPressed: onSave,
          child: Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
        )
      ],
    );
  }
}