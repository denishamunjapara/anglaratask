import 'package:anglaratask/constant.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  AppButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.width,
      this.fontSize,
      this.height});
  void Function()? onPressed;
  String? text;
  double? width;
  double? height;
  double? fontSize;
  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
            height: widget.height ?? 50,
            width: widget.width,
            decoration: BoxDecoration(
                color: Appcolors.greyColor,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              "${widget.text}",
              style: TextStyle(
                  color: Appcolors.whiteColor, fontSize: widget.fontSize ?? 17),
            ))

            //  ElevatedButton(
            //     onPressed: widget.onPressed, child: Text("${widget.text}")),
            ),
      ),
    );
  }
}
