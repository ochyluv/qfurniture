import 'package:flutter/material.dart';
import 'package:qfurniture/ui/shared/colors.dart';
import 'package:qfurniture/ui/shared/text_styles.dart';

class FurnitureTextField extends StatefulWidget {
  const FurnitureTextField({
    Key? key,
    this.onTap,
    this.label,
    this.icon,
    this.labelText,
    this.color,
    this.showPrefix = false,
    this.hintText,
  }) : super(key: key);

  final void Function()? onTap;
  final String? label;
  final Icon? icon;
  final String? labelText;
  final Color? color;
  final bool showPrefix;
  final String? hintText;

  @override
  _FurnitureTextFieldState createState() => _FurnitureTextFieldState();
}

class _FurnitureTextFieldState extends State<FurnitureTextField> {
  @override
  Widget build(BuildContext context) {
    final style = AppStyle.kHeading5;
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
        hintText: widget.hintText,
        hintStyle: style,
        prefixIcon: widget.showPrefix ? Icon(Icons.search) : null,
      ),
    );
  }
}
