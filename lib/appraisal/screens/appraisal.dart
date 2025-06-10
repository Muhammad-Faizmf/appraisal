import 'package:appraisal_project/appraisal/provider/appriasal_provider.dart';
import 'package:appraisal_project/appraisal/screens/show_appraisal_details.dart';
import 'package:appraisal_project/utils/colors.dart';
import 'package:appraisal_project/widgets/appraisal_report_itemview.dart';
import 'package:appraisal_project/widgets/apprisal_report_header.dart';
import 'package:appraisal_project/widgets/custom_base_container.dart';
import 'package:appraisal_project/utils/scale_size.dart';
import 'package:appraisal_project/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Appraisal extends StatefulWidget {
  const Appraisal({super.key});

  @override
  State<Appraisal> createState() => _AppraisalState();
}

class _AppraisalState extends State<Appraisal> {
  @override
  void initState() {
    var provider = Provider.of<AppraisalProvider>(context, listen: false);
    provider.getHierarchyAppraisal();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.resetApprisalValues();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppraisalProvider>(
      context,
    );
    return CustomBaseContainer(
      child: Consumer<AppraisalProvider>(
        builder: (BuildContext context, appraisalProvider, Widget? child) {
          return appraisalProvider.showAppraisalDetails
              ? ShowAppraisalDetails()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: CustomSearchField(
                        controller: provider.searchController,
                        hint: "Search",
                        onChange: (value) {
                          provider.searchAdjustmentApprisal(
                            provider.searchController.text,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: ScaleSize.getHorizontalWidth(
                        context: context,
                        width: 1350,
                      ),
                      margin: const EdgeInsets.only(left: 8.0),
                      child: const AdjustmentReportHeader(
                        col1: "Employee ID",
                        col2: "Name",
                        col3: "Department",
                        col4: "Position",
                      ),
                    ),
                    SizedBox(
                      width: ScaleSize.getHorizontalWidth(
                        context: context,
                        width: 1350,
                      ),
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.heirarchyAppraisal?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: InkWell(
                              onTap: () {
                                appraisalProvider.createBio(index);
                                appraisalProvider.createKpis(index);
                              },
                              child: AdjustmentReportItemView(
                                item1: provider.heirarchyAppraisal![index].empId
                                    .toString(),
                                item2: provider.heirarchyAppraisal![index].name,
                                item3: provider
                                    .heirarchyAppraisal![index].departmentName,
                                item4: provider
                                    .heirarchyAppraisal![index].positionName,
                                backgroudcolor: ColorConstant.reportEvenColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}



