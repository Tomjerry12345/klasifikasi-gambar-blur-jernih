import 'package:flutter/material.dart';

class TextfieldDateComponent extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Color color;
  final String type;

  const TextfieldDateComponent(
      {super.key,
      this.hintText = "",
      this.onChanged,
      this.controller,
      this.color = Colors.white70,
      this.type = "date"});

  @override
  State<TextfieldDateComponent> createState() => _TextfieldDateComponentState();
}

class _TextfieldDateComponentState extends State<TextfieldDateComponent> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.datetime,
      onChanged: widget.onChanged,
      controller: widget.controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          suffixIcon: widget.type == "date"
              ? IconButton(
                  icon: Icon(
                    Icons.date_range,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1960),
                      lastDate: DateTime(2099),
                    ).then((date) {
                      //tambahkan setState dan panggil variabel _dateTime.
                      setState(() {
                        widget.controller?.text = "${date?.day}/${date?.month}/${date?.year}";
                      });
                    });
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.lock_clock,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((time) {
                      //tambahkan setState dan panggil variabel _dateTime.
                      setState(() {
                        widget.controller?.text = "${time?.hour}:${time?.minute}";
                      });
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
          fillColor: widget.color),
    );
  }
}
