import 'package:Appraisal/utils/colors.dart';
import 'package:Appraisal/utils/scale_size.dart';
import 'package:Appraisal/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AdjustmentReportHeader extends StatelessWidget {
  final double? width;
  final String? col1, col2, col3, col4, col5, col6, col7, col8;

  const AdjustmentReportHeader({
    super.key,
    this.col1,
    this.col2,
    this.col3,
    this.col4,
    this.col5,
    this.col6,
    this.col7,
    this.col8,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScaleSize.getHorizontalWidth(
        context: context,
        width: width ?? 1098,
      ),
      height: 59,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5), topRight: Radius.circular(5)),
        color: ColorConstant.primaryDark,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              col1!,
              style: AppStyle.reportHeaderStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              col2!,
              style: AppStyle.reportHeaderStyle,
              textAlign: TextAlign.center,
            ),
          ),
          if (col3 != null)
            Expanded(
              flex: 2,
              child: Text(
                col3!,
                style: AppStyle.reportHeaderStyle,
                textAlign: TextAlign.center,
              ),
            ),
          if (col4 != null)
            Expanded(
              flex: 2,
              child: Text(
                col4!,
                style: AppStyle.reportHeaderStyle,
                textAlign: TextAlign.center,
              ),
            ),
          if (col5 != null)
            Expanded(
              flex: 2,
              child: Text(
                col5!,
                style: AppStyle.reportHeaderStyle,
                textAlign: TextAlign.center,
              ),
            ),
          if (col6 != null)
            Expanded(
              flex: 2,
              child: Text(
                col6!,
                style: AppStyle.reportHeaderStyle,
                textAlign: TextAlign.center,
              ),
            ),
          if (col7 != null)
            Expanded(
              flex: 2,
              child: Text(
                col7!,
                style: AppStyle.reportHeaderStyle,
                textAlign: TextAlign.center,
              ),
            ),
          if (col8 != null)
            Expanded(
              flex: 2,
              child: Text(
                col8!,
                style: AppStyle.reportHeaderStyle,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
