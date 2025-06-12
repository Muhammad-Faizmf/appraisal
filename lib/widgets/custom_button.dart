import 'package:Appraisal/utils/colors.dart';
import 'package:Appraisal/utils/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String btnname;
  void Function()? onTap;
  double? btnwidth;
  double? btnheight;
  TextStyle? btnStyle;
  CustomButton({
    super.key,
    required this.btnname,
    this.onTap,
    this.btnwidth,
    this.btnheight,
    this.btnStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: btnwidth ?? 120),
        child: Container(
          height: btnheight ?? 40.0,
          decoration: BoxDecoration(
            color: ColorConstant.primaryLightBlue,
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              btnname,
              style: btnStyle ?? AppStyle.buttonText,
            ),
          ),
        ),
      ),
    );
  }
}
