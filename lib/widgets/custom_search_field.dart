import 'package:appraisal_project/utils/colors.dart';
import 'package:appraisal_project/utils/scale_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final double? width;
  final String? hint;
  final Function(String) onChange;
  const CustomSearchField({
    super.key,
    required this.hint,
    this.controller,
    this.width,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScaleSize.getHorizontalWidth(
        context: context,
        width: width ?? 340,
      ),
      height: (42),
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: ColorConstant.fieldBorderColor,
        ),
        borderRadius: BorderRadius.circular(4), // Radius
      ),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
            border: InputBorder.none,
            // Border outline
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ColorConstant.hintColor,
            ),
            isDense: false,
            suffixIcon: const Icon(Icons.search_rounded)),
      ),
    );
  }
}
