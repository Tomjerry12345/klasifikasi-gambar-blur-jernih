import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class TextfieldDropdownComponent extends StatelessWidget {
  final String hintText;
  final Function(Object?)? onChanged;
  final List<Map<dynamic, dynamic>>? items;
  final SingleValueDropDownController? controller;

  const TextfieldDropdownComponent(
      {super.key, this.hintText = "", this.onChanged, this.items, this.controller});

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
        onChanged: onChanged,
        controller: controller,
        textFieldDecoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: hintText,
            fillColor: Colors.white),
        dropDownList: items!
            .map((e) => DropDownValueModel(value: e["value"], name: e["name"].toString()))
            .toList());
  }
}
