import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../combonants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.controller,
      this.maxLenght});

  final String hint;
  final int maxLines;
  final int? maxLenght;

  final TextEditingController? controller;

  final void Function(String?)? onSaved;

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required ';
        } else {
          return null;
        }
      },
      cursorRadius: Radius.circular(20),
      cursorHeight: 25,
      cursorColor: Colors.purple,
      maxLines: maxLines,
      maxLength: maxLenght,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(
          Colors.purple,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: BorderSide(
          color: color ?? Colors.blue,
        ));
  }
}

class CustomEditTextField extends StatelessWidget {
  const CustomEditTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.controller,
      this.maxLenght});

  final String hint;
  final int maxLines;
  final int? maxLenght;

  final TextEditingController? controller;

  final void Function(String?)? onSaved;

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required ';
        } else {
          return null;
        }
      },
      cursorRadius: Radius.circular(20),
      cursorHeight: 25,
      cursorColor: Colors.purple,
      maxLines: maxLines,
      maxLength: maxLenght,
      decoration: InputDecoration(
        // enabledBorder: buildBorder(),
        hintText: hint,
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          5,
        ),
        borderSide: BorderSide(
          color: color ?? Colors.blue,
        ));
  }
}
