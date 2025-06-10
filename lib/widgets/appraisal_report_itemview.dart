import 'package:appraisal_project/utils/colors.dart';
import 'package:appraisal_project/utils/scale_size.dart';
import 'package:appraisal_project/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class AdjustmentReportItemView extends StatelessWidget {
  final Color? backgroudcolor;
  final String? item1, item2, item3, item4, item5, item6, item7;
  final VoidCallback? cancelBtnOntap;
  const AdjustmentReportItemView({
    super.key,
    required this.item1,
    required this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
    this.item7,
    this.cancelBtnOntap,
    required this.backgroudcolor,
  });

 @override
Widget build(BuildContext context) {
  return HoverWidget(
    onHover: (_) {},
    hoverChild: _buildContent(context, ColorConstant.reportOddColor),
    child: _buildContent(context, backgroudcolor!),
  );
}

Widget _buildContent(BuildContext context, Color bgColor) {
  return Container(
    width: ScaleSize.getHorizontalWidth(context: context, width: 1098),
    height: 75.0,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
      color: bgColor,
    ),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            item1 ?? '',
            style: AppStyle.reportItemviewStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            item2 ?? '',
            style: AppStyle.reportItemviewStyle,
            textAlign: TextAlign.center,
          ),
        ),
        if (item3 != null)
          Expanded(
            flex: 2,
            child: Text(
              item3!,
              style: AppStyle.reportItemviewStyle,
              textAlign: TextAlign.center,
            ),
          ),
        if (item4 != null)
          Expanded(
            flex: 2,
            child: Text(
              item4!,
              style: AppStyle.reportItemviewStyle,
              textAlign: TextAlign.center,
            ),
          ),
        if (item5 != null)
          Expanded(
            flex: 2,
            child: Text(
              item5!,
              style: AppStyle.reportItemviewStyle,
              textAlign: TextAlign.center,
            ),
          ),
        if (item6 != null)
          Expanded(
            flex: 2,
            child: Text(
              item6!,
              style: AppStyle.reportItemviewStyle,
              textAlign: TextAlign.center,
            ),
          ),
        if (item7 != null)
          Expanded(
            flex: 2,
            child: Text(
              item7!,
              style: AppStyle.reportItemviewStyle,
              textAlign: TextAlign.center,
            ),
          ),
        if (cancelBtnOntap != null)
          Expanded(
            flex: 2,
            child: Align(
              child: InkWell(
                onTap: cancelBtnOntap,
                child: Container(
                  width: 72,
                  height: 28,
                  decoration: BoxDecoration(
                    color: ColorConstant.primaryLightBlue,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Cancel",
                    style: AppStyle.reportHeaderStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}


}
