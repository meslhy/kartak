import 'package:flutter/material.dart';

Widget buildTextField({
  required String labelText,
  required TextEditingController controller
}) {
  return TextFormField(
    controller: controller,
    undoController:UndoHistoryController(value:UndoHistoryValue.empty ) ,
    cursorColor: const Color.fromRGBO(227, 163, 22, 1), // Set the cursor color
    decoration: InputDecoration(
      labelText: labelText,
      floatingLabelStyle: TextStyle(color: Color.fromRGBO(227, 163, 22, 1)),
      labelStyle: TextStyle(
        color: Color.fromARGB(255, 10, 10, 10),
        fontSize: 15,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(5, 5, 5, 1)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(227, 163, 22, 1)),
      ),
    ),
    style: const TextStyle(
      decoration: TextDecoration.none, // Ensure no underline on the input text
    ),
  );
}
