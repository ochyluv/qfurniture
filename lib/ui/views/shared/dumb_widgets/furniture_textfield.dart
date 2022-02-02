import 'package:flutter/material.dart';
import 'package:qfurniture/ui/views/shared/colors.dart';
import 'package:qfurniture/ui/views/shared/text_styles.dart';

class FurnitureTextField extends StatefulWidget {
  const FurnitureTextField({
    Key? key,
    this.onTap,
    this.label,
    this.icon,
    this.labelText,
    this.color,
    this.showPrefix = false,
  }) : super(key: key);

  final void Function()? onTap;
  final String? label;
  final Icon? icon;
  final String? labelText;
  final Color? color;
  final bool showPrefix;

  @override
  _FurnitureTextFieldState createState() => _FurnitureTextFieldState();
}

class _FurnitureTextFieldState extends State<FurnitureTextField> {
  @override
  Widget build(BuildContext context) {
    final style = AppStyle.kHeading3;
    return TextField(
      style: style,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
        ),
        labelText: widget.labelText,
        hintStyle: style,
        prefixIcon: widget.showPrefix ? Icon(Icons.search) : null,
      ),
    );
  }
}
