// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appraisal_project/appraisal/models/get_all_kpis.dart';
import 'package:appraisal_project/appraisal/provider/appriasal_provider.dart';
import 'package:appraisal_project/core/hive_services.dart';

import 'package:appraisal_project/utils/colors.dart';
import 'package:appraisal_project/utils/scale_size.dart';
import 'package:appraisal_project/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomFrame extends StatefulWidget {
  final String? header;
  final int index;
  final List<Kpi>? kpis;

  const CustomFrame({
    super.key,
    this.header,
    required this.kpis,
    required this.index,
  });

  @override
  State<CustomFrame> createState() => _CustomFrameState();
}

class _CustomFrameState extends State<CustomFrame> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppraisalProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.header}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorConstant.hoverColor,
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.kpis?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.symmetric(vertical: 20.0),
                width:
                    ScaleSize.getHorizontalWidth(context: context, width: 1118),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstant.frameBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            widget.kpis![index].childDescription!,
                            style: AppStyle.txtHeadingDarkBold16,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Wrap(
                            children: [
                              evaluationText("5. Excellent"),
                              evaluationText("4. Very Good "),
                              evaluationText("3. Good"),
                              evaluationText("2. Average"),
                              evaluationText("1. Poor"),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Wrap(
                              runSpacing: 10.0,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IgnorePointer(
                                    ignoring:
                                       provider.groupedKpis!.last.kpis
                                            .every(
                                          (kpi) =>
                                              kpi.firstSupervisorMarks != null,
                                        ) ||
                                        HiveService.getEmpId() !=
                                            widget.kpis![index]
                                                .firstSupervisorEmplId,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        hint: Text("Select 1st"),
                                        value: widget
                                            .kpis![index].firstSupervisorMarks
                                            ?.toString(),
                                        items: provider.evaluations.map((val) {
                                          return DropdownMenuItem(
                                            value: val,
                                            child: Text(val),
                                          );
                                        }).toList(),
                                        onChanged: (val) {
                                          provider.onChangedFirstEvaluation(
                                            val,
                                            widget.index,
                                            index,
                                          );
                                          provider.addFirstSupervisorRemarks(
                                            widget.kpis![index].id,
                                            int.parse(val!),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(width: 20),

                                // Second Dropdown
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IgnorePointer(
                                    ignoring: !(widget.kpis![index]
                                                    .secondSupervisorEmplId ==
                                                HiveService.getEmpId() &&
                                            provider.groupedKpis!
                                                .expand((gkpi) => gkpi.kpis)
                                                .every((kpi) =>
                                                    kpi.firstSupervisorMarks !=
                                                    null)) ||
                                        provider.groupedKpis!
                                            .expand((gkpi) => gkpi.kpis)
                                            .every((kpi) =>
                                                kpi.secondSupervisorMarks !=
                                                null),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        hint: Text("Select 2nd"),
                                        value: widget
                                            .kpis![index].secondSupervisorMarks
                                            ?.toString(),
                                        items: provider.evaluations.map((val) {
                                          return DropdownMenuItem(
                                            value: val,
                                            child: Text(val),
                                          );
                                        }).toList(),
                                        onChanged: (val) {
                                          provider.onChangedSecondEvaluation(
                                            val,
                                            widget.index,
                                            index,
                                          );
                                          provider.addSecondSupervisorRemarks(
                                            widget.kpis![index].id,
                                            int.parse(val!),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              );
            }),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

Widget evaluationText(String text) {
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 6,
      horizontal: 12,
    ),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          // ignore: deprecated_member_use
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Text(
      text,
      style: AppStyle.emojiTextlabel,
    ),
  );
}
