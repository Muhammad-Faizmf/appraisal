import 'package:appraisal_project/utils/colors.dart';
import 'package:appraisal_project/utils/scale_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomBaseContainer extends StatelessWidget {
  final Widget child;
  const CustomBaseContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScaleSize.getHorizontalWidth(
        context: context,
        width: 1400,
      ),
      color: ColorConstant.bgColorBody,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
              width: ScaleSize.getHorizontalWidth(
                context: context,
                width: 1350,
              ),
              child: Container(
                padding: EdgeInsets.only(
                    left: 10, right: 10, top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: ColorConstant.white,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
