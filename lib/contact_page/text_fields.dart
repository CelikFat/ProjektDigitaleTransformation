import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final TextEditingController controller; 
  final String name;
  final String? Function(String?)? validator;
  final int? minLines;
  final int? maxLines;

  const TextFields(
    {
      super.key, 
      required this.controller,
      required this.name,
      required this.validator,
      this.minLines,
      this.maxLines,
    }
  );
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(150,0,150,10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        maxLines: maxLines,
        minLines: minLines,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: name,
        ),
        validator: validator,
      ),
    );
  }

}