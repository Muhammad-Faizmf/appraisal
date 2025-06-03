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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppraisalProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Strength column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        "Strength",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: provider.strengthController,
                              inputFormatters:
                                  TextFormatter.firstLetterCapitalize,
                              decoration: const InputDecoration(
                                hintText: 'Enter strength...',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: provider
                                        .heirarchyAppraisal![provider
                                            .selectedApprisalHeirarchyIndex!]
                                        .firstSupervisorEmpId !=
                                    HiveService.getEmpId()
                                ? null
                                : () {
                                    if (provider.strengthController.text
                                        .trim()
                                        .isEmpty) {
                                      EasyLoading.showInfo(
                                          "Strength field can not be empty");
                                      return;
                                    }
                                    provider.addStrength();
                                  },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.strengths?.length ?? 0,
                        itemBuilder: (context, index) => ListTile(
                          title: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              "${index + 1}. ${provider.strengths![index].description}",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Weakness column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        "Weakness",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: provider.weaknessController,
                              inputFormatters:
                                  TextFormatter.firstLetterCapitalize,
                              decoration: const InputDecoration(
                                hintText: 'Enter weakness...',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: provider
                                        .heirarchyAppraisal![provider
                                            .selectedApprisalHeirarchyIndex!]
                                        .firstSupervisorEmpId !=
                                    HiveService.getEmpId()
                                ? null
                                : () {
                                    if (provider.weaknessController.text
                                        .trim()
                                        .isEmpty) {
                                      EasyLoading.showInfo(
                                          "Weakness field can not be empty");
                                      return;
                                    }
                                    provider.addWeakness();
                                  },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.weakness?.length ?? 0,
                        itemBuilder: (context, index) => ListTile(
                          title: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              "${index + 1}. ${provider.weakness![index].description}",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Training Section
          Center(
            child: Column(
              children: [
                const Text(
                  "Training & Recommendation",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: provider.trainingController,
                  inputFormatters: TextFormatter.firstLetterCapitalize,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Enter training & recommendation details...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: CustomButton(
                    onTap: () {
                      if (provider.trainingController.text.trim().isEmpty) {
                        EasyLoading.showInfo(
                          "training & recommendation is mandatory",
                        );
                        return;
                      }
                      if (provider
                                  .heirarchyAppraisal![
                                      provider.selectedApprisalHeirarchyIndex!]
                                  .firstSupervisorEmpId !=
                              HiveService.getEmpId() &&
                          provider
                                  .heirarchyAppraisal![
                                      provider.selectedApprisalHeirarchyIndex!]
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
                SizedBox(height: 10.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: provider.groupedList.length,
                  itemBuilder: (context, index) {
                    final group = provider.groupedList[index];
                    final createrName = group.value['createrName'];
                    final descriptions =
                        group.value['descriptions'] as List<String>;
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
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            createrName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.hoverColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...descriptions.map((desc) => Text('- $desc')),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 32),
          // CHRO remarks
          Center(
            child: Column(
              children: [
                const Text(
                  "Chief Remarks",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
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
                      if (provider.chiefRemarksController.text.trim().isEmpty) {
                        EasyLoading.showInfo("Chief remarks is mandatory");
                        return;
                      }
                      if (provider
                              .heirarchyAppraisal![
                                  provider.selectedApprisalHeirarchyIndex!]
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
                SizedBox(height: 10.0),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.chroRemarks?.length ?? 0,
                  itemBuilder: (context, index) => Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
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
            ),
          )
        ],
      ),
    );
  }
}
