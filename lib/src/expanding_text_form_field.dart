library customized_text_field;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpandingTextFormField extends StatefulWidget {
  final Duration? animationDuration;
  final Curve? curve;

  ///Text field constructors
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization = TextCapitalization.none;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign = TextAlign.start;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus = false;
  final bool readOnly = false;
  final bool? showCursor;
  final String obscuringCharacter = '•';
  final bool obscureText = false;
  final bool autocorrect = true;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions = true;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines = 1;
  final int? minLines;
  final bool expands = false;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding = const EdgeInsets.all(20.0);
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autoValidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning = true;
  final MouseCursor? mouseCursor;
  final EditableTextContextMenuBuilder? contextMenuBuilder;

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

  const ExpandingTextFormField({
    this.animationDuration,
    this.curve,
    this.controller,
    this.onChanged,
    this.onTap,
    this.contextMenuBuilder,
    required this.unfocusedFieldSize,
    required this.focusedFieldSize,
    this.initialValue,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.autofillHints,
    this.autoValidateMode,
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
  State<ExpandingTextFormField> createState() => _ExpandingTextFormFieldState();
}

class _ExpandingTextFormFieldState extends State<ExpandingTextFormField> {
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
      child: TextFormField(
        key: widget.key,
        focusNode: _focusNode,
        controller: widget.controller,
        initialValue: widget.initialValue,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        enabled: widget.enabled,
        expands: widget.expands,
        scrollController: widget.scrollController,
        scrollPhysics: widget.scrollPhysics,
        onEditingComplete: widget.onEditingComplete,
        onTapOutside: widget.onTapOutside,
        keyboardType: widget.keyboardType,
        keyboardAppearance: widget.keyboardAppearance,
        autovalidateMode: widget.autoValidateMode,
        autocorrect: widget.autocorrect,
        autofocus: widget.autofocus,
        autofillHints: widget.autofillHints,
        textAlign: widget.textAlign,
        textDirection: widget.textDirection,
        textAlignVertical: widget.textAlignVertical,
        obscureText: widget.obscureText,
        obscuringCharacter: widget.obscuringCharacter,
        validator: widget.validator,
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
        buildCounter: widget.buildCounter,
        contextMenuBuilder: widget.contextMenuBuilder,
        enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        restorationId: widget.restorationId,
        scrollPadding: widget.scrollPadding,
        selectionControls: widget.selectionControls,
        showCursor: widget.showCursor,
        smartDashesType: widget.smartDashesType,
        smartQuotesType: widget.smartQuotesType,
        strutStyle: widget.strutStyle,
      ),
    );
  }
}
