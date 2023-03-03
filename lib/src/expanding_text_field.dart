library customized_text_field;

import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpandingTextField extends StatefulWidget {
  final Duration? animationDuration;
  final Curve? curve;

  ///Text field constructors
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization = TextCapitalization.none;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign = TextAlign.start;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly = false;
  final bool? showCursor;
  final bool autofocus = false;
  final String obscuringCharacter = '•';
  final bool obscureText = false;
  final bool autocorrect = true;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions = true;
  final int? maxLines = 1;
  final int? minLines;
  final bool expands = false;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final BoxHeightStyle selectionHeightStyle = BoxHeightStyle.tight;
  final BoxWidthStyle selectionWidthStyle = BoxWidthStyle.tight;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding = const EdgeInsets.all(20.0);
  final DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints = const <String>[];
  final Clip clipBehavior = Clip.hardEdge;
  final String? restorationId;
  final bool scribbleEnabled = true;
  final bool enableIMEPersonalizedLearning = true;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// required parameters
  final double unfocusedFieldSize;
  final double focusedFieldSize;

  ///Customized input decoration constructors
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Widget? label;
  final String? hintText;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? errorText;
  final TextStyle? errorStyle;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;

  const ExpandingTextField({
    this.animationDuration,
    this.curve,
    this.controller,
    this.onChanged,
    this.onTap,
    this.contextMenuBuilder,
    required this.unfocusedFieldSize,
    required this.focusedFieldSize,
    this.style,
    this.decoration,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.strutStyle,
    this.textAlignVertical,
    this.textDirection,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.minLines,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.keyboardAppearance,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.onTapOutside,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.restorationId,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.label,
    this.hintText,
    this.labelText,
    this.labelStyle,
    this.errorText,
    this.errorStyle,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.cursorHeight,
    this.cursorColor,
    this.cursorRadius,
    this.cursorWidth,
    this.enabled,
    Key? key,
  }) : super(key: key);

  @override
  State<ExpandingTextField> createState() => _ExpandingTextFieldState();
}

class _ExpandingTextFieldState extends State<ExpandingTextField> {
  final FocusNode _focusNode = FocusNode();
  double? _textFieldSize;

  @override
  void initState() {
    super.initState();
    changeTextFieldSize();
  }

  void changeTextFieldSize() {
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
        key: widget.key,
        focusNode: _focusNode,
        controller: widget.controller,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        enabled: widget.enabled,
        expands: widget.expands,
        scrollController: widget.scrollController,
        scrollPhysics: widget.scrollPhysics,
        onEditingComplete: widget.onEditingComplete,
        onSubmitted: widget.onSubmitted,
        onTapOutside: widget.onTapOutside,
        keyboardType: widget.keyboardType,
        keyboardAppearance: widget.keyboardAppearance,
        autocorrect: widget.autocorrect,
        autofocus: widget.autofocus,
        autofillHints: widget.autofillHints,
        textAlign: widget.textAlign,
        textDirection: widget.textDirection,
        textAlignVertical: widget.textAlignVertical,
        obscureText: widget.obscureText,
        obscuringCharacter: widget.obscuringCharacter,
        style: widget.style ??
            const TextStyle(
              fontSize: 18.0,
            ),
        decoration: widget.decoration ??
            InputDecoration(
              label: widget.label,
              hintText: widget.hintText,
              labelText: widget.labelText,
              labelStyle: widget.labelStyle,
              errorText: widget.errorText,
              errorStyle: widget.errorStyle,
              prefix: widget.prefix,
              suffix: widget.suffix,
              prefixIcon: widget.prefixIcon,
              prefixIconColor: widget.prefixIconColor,
              suffixIcon: widget.suffixIcon,
              suffixIconColor: widget.suffixIconColor,
              border: widget.border,
              focusedBorder: widget.focusedBorder ??
                  OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
              enabledBorder: widget.enabledBorder ??
                  OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
              errorBorder: widget.errorBorder ??
                  OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
              focusedErrorBorder: widget.focusedErrorBorder ??
                  OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
            ),
        cursorHeight: widget.cursorHeight,
        cursorColor: widget.cursorColor,
        cursorRadius: widget.cursorRadius,
        cursorWidth: widget.cursorWidth ?? 2.0,
        textInputAction: widget.textInputAction,
        inputFormatters: widget.inputFormatters,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        mouseCursor: widget.mouseCursor,
        textCapitalization: widget.textCapitalization,
        enableSuggestions: widget.enableSuggestions,
        clipBehavior: widget.clipBehavior,
        buildCounter: widget.buildCounter,
        contextMenuBuilder: widget.contextMenuBuilder,
        dragStartBehavior: widget.dragStartBehavior,
        enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        magnifierConfiguration: widget.magnifierConfiguration,
        onAppPrivateCommand: widget.onAppPrivateCommand,
        restorationId: widget.restorationId,
        scribbleEnabled: widget.scribbleEnabled,
        scrollPadding: widget.scrollPadding,
        selectionControls: widget.selectionControls,
        selectionHeightStyle: widget.selectionHeightStyle,
        selectionWidthStyle: widget.selectionWidthStyle,
        showCursor: widget.showCursor,
        smartDashesType: widget.smartDashesType,
        smartQuotesType: widget.smartQuotesType,
        spellCheckConfiguration: widget.spellCheckConfiguration,
        strutStyle: widget.strutStyle,
      ),
    );
  }
}
