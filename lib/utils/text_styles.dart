import 'package:Appraisal/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  BuildContext context;
  AppStyle(this.context);

  static TextStyle txtHeadingDarkBold48 = GoogleFonts.teko(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: ColorConstant.primaryLightBlue,
  );
  static TextStyle txtHeadingDarkBold32 = GoogleFonts.teko(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: ColorConstant.primaryLightBlue,
  );

  static TextStyle loginDescription = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: ColorConstant.darkGrey,
  );

  static TextStyle txtlabel = GoogleFonts.inter(
    fontSize: (12),
    fontWeight: FontWeight.w400,
    color: ColorConstant.labelColor,
  );

  static TextStyle rememberMe = GoogleFonts.inter(
    fontSize: (14),
    fontWeight: FontWeight.w500,
    color: ColorConstant.hintColor,
  );

  static TextStyle txtHint = GoogleFonts.inter(
    fontSize: 14, // change from 12 to 14
    fontWeight: FontWeight.w400,
    color: ColorConstant.hintColor,
  );

  static TextStyle loginPageTitleWeb = GoogleFonts.teko(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 1,
    color: ColorConstant.primaryLightBlue,
  );

  static TextStyle moduleScreeenHeader = GoogleFonts.teko(
    fontSize: (24),
    fontWeight: FontWeight.w500,
    color: ColorConstant.white,
  );
  static TextStyle txtPath = GoogleFonts.inter(
    fontSize: (12),
    fontWeight: FontWeight.w500,
    color: ColorConstant.hintColor,
  );

  static TextStyle appVersion = GoogleFonts.inter(
    fontSize: (14),
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: ColorConstant.hoverColor,
  );

  static TextStyle reportHeaderStyle = GoogleFonts.inter(
    fontSize: (14),
    fontWeight: FontWeight.w500,
    color: ColorConstant.white,
  );

  static TextStyle reportItemviewStyle = GoogleFonts.inter(
    fontSize: (16),
    fontWeight: FontWeight.w700,
    color: ColorConstant.black,
  );

  static TextStyle buttonText = GoogleFonts.teko(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: ColorConstant.white,
  );
  static TextStyle txtHeadingDarkBold16 = GoogleFonts.teko(
    fontSize: (20),
    fontWeight: FontWeight.w500,
    color: ColorConstant.black,
  );
  static TextStyle emojiTextlabel = GoogleFonts.inter(
    fontSize: (15),
    fontWeight: FontWeight.w500,
    color: ColorConstant.labelColor,
  );
}
