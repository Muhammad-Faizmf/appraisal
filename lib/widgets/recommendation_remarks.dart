import 'package:appraisal_project/appraisal/provider/appriasal_provider.dart';
import 'package:appraisal_project/core/hive_services.dart';
import 'package:appraisal_project/utils/colors.dart';
import 'package:appraisal_project/utils/text_formatter.dart';
import 'package:appraisal_project/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class RecommendationAndRemarks extends StatefulWidget {
  const RecommendationAndRemarks({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RecommendationAndRemarksState createState() =>
      _RecommendationAndRemarksState();
}

class _RecommendationAndRemarksState extends State<RecommendationAndRemarks> {
  @override
  void initState() {
    var provider = Provider.of<AppraisalProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.resetFields();
    });

    provider.getStrengthAndWeakness();
    provider.getTraning();
    provider.getCHRORemarks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppraisalProvider>(context);

    if (provider.heirarchyAppraisal == null ||
        provider.selectedApprisalHeirarchyIndex == null ||
        provider.selectedApprisalHeirarchyIndex! >=
            provider.heirarchyAppraisal!.length ||
        provider.chroRemarks == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final appraisal =
        provider.heirarchyAppraisal![provider.selectedApprisalHeirarchyIndex!];
    final isFirstSupervisor =
        appraisal.firstSupervisorEmpId == HiveService.getEmpId();
    final isSecondSupervisor =
        appraisal.secondSupervisorEmpId == HiveService.getEmpId();
    final isChief = appraisal.departmentalChiefId == HiveService.getEmpId();

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Strength Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Strength",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      if (isFirstSupervisor)
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.41,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: provider.strengthController,
                                  decoration: InputDecoration(
                                    hintText: "Enter Strength",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.green,
                                  side: const BorderSide(color: Colors.green),
                                ),
                                onPressed: () {
                                  if (provider.strengthController.text
                                      .trim()
                                      .isEmpty) {
                                    EasyLoading.showInfo(
                                        "Strength field cannot be empty");
                                    return;
                                  }
                                  provider.addStrength();
                                },
                                child: const Text('Add'),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 10.0),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.strengths?.length ?? 0,
                        itemBuilder: (context, index) => ListTile(
                          title: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                                "${index + 1}. ${provider.strengths![index].description}"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(thickness: 3),
              // Weakness Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Weakness",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      if (isFirstSupervisor)
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.41,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: provider.weaknessController,
                                  decoration: InputDecoration(
                                    hintText: "Enter Weakness",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red,
                                  side: const BorderSide(color: Colors.red),
                                ),
                                onPressed: () {
                                  if (provider.weaknessController.text
                                      .trim()
                                      .isEmpty) {
                                    EasyLoading.showInfo(
                                        "Weakness field cannot be empty");
                                    return;
                                  }
                                  provider.addWeakness();
                                },
                                child: const Text('Add'),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 10.0),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.weakness?.length ?? 0,
                        itemBuilder: (context, index) => ListTile(
                          title: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                                "${index + 1}. ${provider.weakness![index].description}"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(thickness: 3),
          // Training Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Training & Recommendation",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                              const SizedBox(height: 8),
                  if (isSecondSupervisor)
                  Column(
                        children: [
                          TextField(
                            controller: provider.trainingController,
                            inputFormatters:
                                TextFormatter.firstLetterCapitalize,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText:
                                  "Enter training & recommendation details...",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.all(12),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: CustomButton(
                              onTap: () {
                                if (provider.trainingController.text
                                    .trim()
                                    .isEmpty) {
                                  EasyLoading.showInfo(
                                    "training & recommendation is mandatory",
                                  );
                                  return;
                                }
                                if (provider
                                            .heirarchyAppraisal![provider
                                                .selectedApprisalHeirarchyIndex!]
                                            .firstSupervisorEmpId !=
                                        HiveService.getEmpId() &&
                                    provider
                                            .heirarchyAppraisal![provider
                                                .selectedApprisalHeirarchyIndex!]
                                            .secondSupervisorEmpId !=
                                        HiveService.getEmpId()) {
                                  EasyLoading.showInfo(
                                    "Only supervisors can add this details",
                                  );
                                  return;
                                }
                                provider.addTraining();
                              },
                              btnname: "Add",
                            ),
                          ),
                        ],
                      ),
                
                  const SizedBox(height: 10.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.hrTraning?.length ?? 0,
                    itemBuilder: (context, index) => ListTile(
                      title: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                            "${index + 1}. ${provider.hrTraning![index].description}"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Divider(thickness: 3),

          Center(
              child: Column(
            children: [
              const Text(
                "Chief Remarks",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              isChief
                  ? Column(
                      children: [
                        TextField(
                          controller: provider.chiefRemarksController,
                          maxLines: 2,
                          inputFormatters: TextFormatter.firstLetterCapitalize,
                          decoration: InputDecoration(
                            hintText: "Enter chief remarks...",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            contentPadding: const EdgeInsets.all(12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: CustomButton(
                            onTap: () {
                              if (provider.chiefRemarksController.text
                                  .trim()
                                  .isEmpty) {
                                EasyLoading.showInfo(
                                    "Chief remarks is mandatory");
                                return;
                              }
                              if (provider
                                      .heirarchyAppraisal![provider
                                          .selectedApprisalHeirarchyIndex!]
                                      .departmentalChiefId !=
                                  HiveService.getEmpId()) {
                                EasyLoading.showInfo(
                                  "Only chief can add this remarks",
                                );
                                return;
                              }
                              provider.addChiefRemarks();
                            },
                            btnname: "Add",
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
              SizedBox(height: 10.0),
              provider.chroRemarks!.isEmpty
                  ? Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        "Remarks Not Given Yet",
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.chroRemarks?.length ?? 0,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          provider.chroRemarks![index].description,
                        ),
                      ),
                    ),
            ],
          ))
        ],
      ),
    );
  }
}
