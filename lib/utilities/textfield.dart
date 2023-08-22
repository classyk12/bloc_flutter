import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Color? textColor;
  final double? borderWidth;
  final FocusNode? focusNode;
  final String? hintText;
  final String? Function(String?)? validator;
  final VoidCallback? iconAction;
  final String? labelText;
  final Color? labelTextColor;
  final double? labelFontSize;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  final IconData? icon;
  final double? hintTextSize;
  final bool? isPassword;
  final EdgeInsetsGeometry? contentPadding;
  final Function? onChanged;
  final double? textSize;
  final Color? color;
  final bool readOnly;
  final bool? enabled;
  final int? maxLines;

  const TextInput(
      {Key? key,
      @required this.controller,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.labelFontSize,
      this.hintTextSize,
      this.hintText,
      this.labelTextColor,
      this.prefixWidget,
      this.suffixWidget,
      this.icon,
      this.borderWidth,
      this.borderColor,
      this.focusedBorderColor,
      this.enabled,
      this.isPassword,
      this.iconAction,
      this.labelText = '',
      this.textColor,
      this.contentPadding,
      this.focusNode,
      this.maxLines = 1,
      this.onChanged,
      this.textSize = 12,
      this.color = Colors.transparent,
      this.readOnly = false})
      : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: TextFormField(
          maxLines: widget.maxLines,
          readOnly: widget.readOnly,
          enabled: widget.enabled ?? true,
          validator: widget.validator,
          onChanged: (value) => widget.onChanged,
          focusNode: widget.focusNode,
          obscureText: widget.isPassword!,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          style: TextStyle(color: widget.textColor, fontSize: 16),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Colors.transparent,
            filled: true,
            hintText: widget.hintText ?? '',
            labelStyle: TextStyle(
                color: widget.labelTextColor,
                fontSize: widget.textSize,
                fontFamily: 'BasisGrotesquePro',
                letterSpacing: 0.0),
            //  hintText: this.widget.hintText ?? null,
            isDense: true,
            hintStyle: TextStyle(
                color: Colors.grey,
                // letterSpacing: hintTextSpacing,
                fontSize: widget.hintTextSize ?? 12.0),
            //prefix: this.widget.prefixWidget ?? null,
            prefixIcon: widget.prefixWidget,
            suffixIcon: widget.suffixWidget ??
                InkWell(
                  child: Icon(widget.icon,
                      size: 25,
                      color: widget.isPassword! == true
                          ? Colors.grey.withOpacity(0.4)
                          : Colors.green),
                  onTap: widget.iconAction,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: widget.borderColor ?? Colors.white,
                width: widget.borderWidth ?? 1,
              ),
            ),
          ),
        ));
  }
}
