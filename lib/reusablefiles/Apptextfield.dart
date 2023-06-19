import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  AppTextField(
      {super.key,
      this.hintText,
      this.labelText,
      this.controller,
      this.onChanged,
      this.minLines,
      this.onSubmitted,
      this.height,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLines});
  String? hintText;
  int? minLines;
  int? maxLines;
  String? labelText;
  void Function(String)? onSubmitted;
  TextEditingController? controller;
  double? height;
  void Function(String)? onChanged;
  Widget? prefixIcon;
  Widget? suffixIcon;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return 'filed id required';
        } //
        return null;
      },

      //onSubmitted: widget.onSubmitted,
      onChanged: widget.onChanged,
      controller: widget.controller,
      // maxLines: null //1 ?? widget.maxLines,
      maxLines: widget.maxLines ?? 1,
      //  minLines: 1 ?? widget.minLines,
      decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          isDense: true,
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          //border: const UnderlineInputBorder(),
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(5),
          //     borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.black87))),
    );
  }
}
