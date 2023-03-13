import 'package:flutter/material.dart';

class UserNameTextField extends StatefulWidget {
  final TextEditingController controller;

  const UserNameTextField({required this.controller});

  @override
  State<UserNameTextField> createState() => _UserNameTextFieldState();
}

class _UserNameTextFieldState extends State<UserNameTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        hintText: 'Введите имя',
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
