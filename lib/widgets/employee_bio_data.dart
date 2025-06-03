import 'package:appraisal_project/appraisal/provider/appriasal_provider.dart';
import 'package:appraisal_project/utils/scale_size.dart';
import 'package:appraisal_project/widgets/custom_employee_container.dart';
import 'package:appraisal_project/widgets/custom_text_fiel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeBioData extends StatelessWidget {
  const EmployeeBioData({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppraisalProvider>(context);
    return Column(
      children: [
        CustomEmployeeContainer(
          empId: provider
              .heirarchyAppraisal![provider.selectedApprisalHeirarchyIndex!]
              .empId
              .toString(),
          empName: provider
              .heirarchyAppraisal![provider.selectedApprisalHeirarchyIndex!]
              .name,
          empPositon: provider
              .heirarchyAppraisal![provider.selectedApprisalHeirarchyIndex!]
              .positionName,
          empDept: provider
              .heirarchyAppraisal![provider.selectedApprisalHeirarchyIndex!]
              .departmentName,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextField(
              label: "Min. Grade",
              readonly: true,
              controller: TextEditingController(
                text: provider
                    .heirarchyAppraisal![
                        provider.selectedApprisalHeirarchyIndex!]
                    .minGradeName,
              ),
            ),
            CustomTextField(
              label: "Max. Grade",
              readonly: true,
              controller: TextEditingController(
                text: provider
                    .heirarchyAppraisal![
                        provider.selectedApprisalHeirarchyIndex!]
                    .maxGradeName,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextField(
              label: "Min. Salary",
              readonly: true,
              controller: TextEditingController(
                text: provider
                    .heirarchyAppraisal![
                        provider.selectedApprisalHeirarchyIndex!]
                    .minSalary
                    .toString(),
              ),
            ),
            CustomTextField(
              label: "Max. Salary",
              readonly: true,
              controller: TextEditingController(
                text: provider
                    .heirarchyAppraisal![
                        provider.selectedApprisalHeirarchyIndex!]
                    .maxSalary
                    .toString(),
              ),
            ),
          ],
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTextField(
                label: "Current Grade",
                readonly: true,
                controller: TextEditingController(
                  text: provider
                      .heirarchyAppraisal![
                          provider.selectedApprisalHeirarchyIndex!]
                      .gradeName,
                ),
              ),
              CustomTextField(
                label: "Tenure",
                readonly: true,
                controller: TextEditingController(
                  text: provider
                      .heirarchyAppraisal![
                          provider.selectedApprisalHeirarchyIndex!]
                      .tenureInYears,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextField(
              label: "First Supervisor",
              readonly: true,
              controller: TextEditingController(
                text: provider
                    .heirarchyAppraisal![
                        provider.selectedApprisalHeirarchyIndex!]
                    .firstSupervisorName,
              ),
            ),
            CustomTextField(
              label: "Second Supervisor",
              readonly: true,
              controller: TextEditingController(
                text: provider
                    .heirarchyAppraisal![
                        provider.selectedApprisalHeirarchyIndex!]
                    .uSecondSupervisorName,
              ),
            ),
          ],
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTextField(
                label: "Gross Salary",
                readonly: true,
                controller: TextEditingController(
                  text: provider
                      .heirarchyAppraisal![
                          provider.selectedApprisalHeirarchyIndex!]
                      .grossSalary
                      .toString(),
                ),
              ),
              CustomTextField(
                label: "Total Salary",
                readonly: true,
                controller: TextEditingController(
                  text: provider
                      .heirarchyAppraisal![
                          provider.selectedApprisalHeirarchyIndex!]
                      .totalSalary
                      .toString(),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextField(
              label: "Bonus",
              readonly: true,
              controller: TextEditingController(
                text: provider
                    .heirarchyAppraisal![
                        provider.selectedApprisalHeirarchyIndex!]
                    .bonus
                    .toString(),
              ),
            ),
            SizedBox(
              width: ScaleSize.getHorizontalWidth(
                context: context,
                width: 340.0,
              ),
            )
          ],
        ),
      ],
    );
  }
}
