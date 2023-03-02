library customized_text_field;

import 'package:flutter/material.dart';

class CustomizedTextField extends StatefulWidget {
  final Duration? animationDuration;
  final Curve? curve;
  final double unfocusedFieldSize;
  final double focusedFieldSize;
  final TextStyle? textStyle;
  final InputDecoration? inputDecoration;
  final Widget? label;
  final String? hintText;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;

  const CustomizedTextField({
    this.animationDuration,
    this.curve,
    required this.unfocusedFieldSize,
    required this.focusedFieldSize,
    this.textStyle,
    this.inputDecoration,
    this.label,
    this.hintText,
    this.labelText,
    this.labelStyle,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomizedTextField> createState() => _CustomizedTextFieldState();
}

class _CustomizedTextFieldState extends State<CustomizedTextField> {
  final FocusNode _focusNode = FocusNode();
  double? _textFieldSize;

  @override
  void initState() {
    super.initState();
    changeTextFieldSize(context);
  }

  void changeTextFieldSize(BuildContext context) {
    _textFieldSize = widget.unfocusedFieldSize;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _textFieldSize = widget.focusedFieldSize;
        setState(() {});
      } else {
        _textFieldSize = widget.unfocusedFieldSize;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.animationDuration ?? const Duration(milliseconds: 400),
      curve: widget.curve ?? Curves.fastOutSlowIn,
      width: _textFieldSize,
      padding: const EdgeInsets.only(top: 12, right: 18, left: 8),
      child: TextField(
        focusNode: _focusNode,
        style: widget.textStyle ??
            const TextStyle(
              fontSize: 18.0,
            ),
        decoration: widget.inputDecoration ??
            InputDecoration(
              label: widget.label,
              hintText: widget.hintText,
              labelText: widget.labelText,
              labelStyle: widget.labelStyle,
              prefix: widget.prefix,
              suffix: widget.suffix,
              prefixIcon: widget.prefixIcon,
              prefixIconColor: widget.prefixIconColor,
              suffixIcon: widget.suffixIcon,
              suffixIconColor: widget.suffixIconColor,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
      ),
    );
  }
}
