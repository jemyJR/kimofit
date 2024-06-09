import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.hintText,
    this.onSaved,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon = false,
    this.controller,
  });

  final String hintText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool suffixIcon;
  final TextEditingController? controller;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onSaved: widget.onSaved,
      validator: widget.validator,
      obscureText: (widget.obscureText && _obscureText),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyles.font18White,
      textAlign: TextAlign.justify,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        isDense: true,
        fillColor: ColorsManager.dark,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: ColorsManager.blue),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyles.font18Gray,
        suffixIcon: widget.suffixIcon
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
