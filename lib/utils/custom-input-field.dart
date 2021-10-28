import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hris/utils/constant.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final bool obscureText;
  // final FocusNode focusNode = FocusNode();

  const CustomInputField({@required this.label, @required this.prefixIcon, this.obscureText = false})
  : assert(label != null),
  assert(prefixIcon != null);

  @override
  Widget build(BuildContext context) {
    return TextField(
      // focusNode: _focusNode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(kPaddingM),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.12),
            width: 1
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.12),
            width: 1
          ),
        ),
        hintText: label,
        hintStyle: GoogleFonts.openSans(
          textStyle: TextStyle(
            color: kContentColorLightTheme.withOpacity(0.5),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          )
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: kContentColorLightTheme.withOpacity(0.5),
        ),
      ),
      // obscureText: obscureText,
    );
  }
}