import 'package:flutter/material.dart';

class TextfieldPasswordComponent extends StatefulWidget {
  final String hintText;
  final String label;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const TextfieldPasswordComponent(
      {super.key, this.hintText = "", this.onChanged, this.controller, this.label = ""});

  @override
  State<TextfieldPasswordComponent> createState() => _TextfieldPasswordComponentState();
}

class _TextfieldPasswordComponentState extends State<TextfieldPasswordComponent> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      cursorColor: Colors.black,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: widget.hintText,
          label: Text(widget.label),
          fillColor: Colors.white70),
    );
  }
}
