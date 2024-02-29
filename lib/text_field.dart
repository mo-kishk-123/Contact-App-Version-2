import 'package:flutter/material.dart';

typedef valid = String? Function(String?);

class Field extends StatelessWidget {

  TextEditingController controller;
  String hint;
  Icon icon;
  TextInputType type;
  valid validator;

  Field({super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.type,
    required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: TextFormField(
        controller: controller,
        validator:validator,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          fillColor: Colors.white,
          filled: true,
          focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          suffixIcon: icon,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          errorStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30)
          )
        ),
        keyboardType: type,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
