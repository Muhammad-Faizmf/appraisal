import 'package:Appraisal/appraisal/provider/appriasal_provider.dart';
import 'package:Appraisal/utils/colors.dart';
import 'package:Appraisal/utils/scale_size.dart';
import 'package:Appraisal/widgets/custom_arrow_buttons.dart';
import 'package:Appraisal/widgets/employee_bio_data.dart';
import 'package:Appraisal/widgets/general_kpis.dart';
import 'package:Appraisal/widgets/recommendation_remarks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShowAppraisalDetails extends StatefulWidget {
  const ShowAppraisalDetails({super.key});

  @override
  State<ShowAppraisalDetails> createState() => _ShowAppraisalDetailsState();
}

class _ShowAppraisalDetailsState extends State<ShowAppraisalDetails> {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppraisalProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer<AppraisalProvider>(
          builder: (BuildContext context, adjustmentsProvider, Widget? child) {
            return SizedBox(
              width: ScaleSize.getHorizontalWidth(
                context: context,
                width: 1350,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        provider.resetApprisalValues();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        width: ScaleSize.getHorizontalWidth(
                          context: context,
                          width: 1200,
                        ),
                        height: (61),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < provider.tabs.length; i++)
                              SizedBox(
                                width: ScaleSize.getHorizontalWidth(
                                  context: context,
                                  width: 300.0,
                                ),
                                child: MouseRegion(
                                  onEnter: (_) {
                                    Provider.of<AppraisalProvider>(context,
                                            listen: false)
                                        .setHoveredBtnIndex(i);
                                  },
                                  onExit: (_) {
                                    Provider.of<AppraisalProvider>(
                                      context,
                                      listen: false,
                                    ).setHoveredBtnIndex(-1);
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      provider.setSelectedBtnIndex(i);
                                    },
                                    child: i == 0
                                        ? Stack(
                                            children: [
                                              ClipPath(
                                                clipper:
                                                    CustomLeftArrowClipper(),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: provider
                                                              .selectedBtnIndex ==
                                                          i
                                                      ? ColorConstant
                                                          .primaryLightBlue
                                                      : provider.hoveredBtnIndex ==
                                                              i
                                                          ? ColorConstant
                                                              .hoverColor
                                                          : ColorConstant.white,
                                                  child: Text(
                                                    provider.tabs[i],
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.teko(
                                                      fontSize: 24.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: provider
                                                                  .selectedBtnIndex ==
                                                              i
                                                          ? ColorConstant.white
                                                          : provider.hoveredBtnIndex ==
                                                                  i
                                                              ? ColorConstant
                                                                  .white
                                                              : ColorConstant
                                                                  .black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              CustomPaint(
                                                size: Size(
                                                  ScaleSize.getHorizontalWidth(
                                                      context: context,
                                                      width: 367.0),
                                                  61,
                                                ),
                                                painter:
                                                    CustomLeftArrowBorderPainter(
                                                  color: ColorConstant
                                                      .fieldBorderColor,
                                                  borderWidth: 1.0,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Stack(
                                            children: [
                                              ClipPath(
                                                clipper:
                                                    CustomRightArrowClipper(),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: provider
                                                              .selectedBtnIndex ==
                                                          i
                                                      ? ColorConstant
                                                          .primaryLightBlue
                                                      : provider.hoveredBtnIndex ==
                                                              i
                                                          ? ColorConstant
                                                              .hoverColor
                                                          : ColorConstant.white,
                                                  child: Text(
                                                    provider.tabs[i],
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.teko(
                                                      fontSize: 24.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: provider
                                                                  .selectedBtnIndex ==
                                                              i
                                                          ? ColorConstant.white
                                                          : provider.hoveredBtnIndex ==
                                                                  i
                                                              ? ColorConstant
                                                                  .white
                                                              : ColorConstant
                                                                  .black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              CustomPaint(
                                                size: Size(
                                                  ScaleSize.getHorizontalWidth(
                                                    context: context,
                                                    width: 367.0,
                                                  ),
                                                  61,
                                                ),
                                                painter:
                                                    CustomRightArrowBorderPainter(
                                                  color: ColorConstant
                                                      .fieldBorderColor,
                                                  borderWidth: 1.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            );
          },
        ),
        provider.selectedBtnIndex == 0
            ? EmployeeBioData()
            : provider.selectedBtnIndex == 1
                ? GeneralKPIs()
                : RecommendationAndRemarks()
      ],
    );
  }
}

class MiddleDoubleArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Left arrow pointing outward
    path.moveTo(0, 0);
    path.lineTo(20, size.height / 2);
    path.lineTo(0, size.height);

    // Right arrow pointing inward
    path.lineTo(size.width - 20, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, 0);

    // Completing the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MiddleDoubleArrowBorderPainter extends CustomPainter {
  final Color color;
  final double borderWidth;

  MiddleDoubleArrowBorderPainter(
      {required this.color, required this.borderWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final path = MiddleDoubleArrowClipper().getClip(size);

    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
