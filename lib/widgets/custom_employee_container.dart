import 'package:Appraisal/utils/colors.dart';
import 'package:Appraisal/utils/scale_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomEmployeeContainer extends StatelessWidget {
  final String empId, empName, empPositon, empDept;
  // minGrade,
  // maxGrade,
  // grossSalary,
  // totalSalary,
  // bonus,
  // tenure;
  const CustomEmployeeContainer({
    super.key,
    required this.empId,
    required this.empName,
    required this.empPositon,
    required this.empDept,
    // this.minGrade,
    // this.maxGrade,
    // this.grossSalary,
    // this.totalSalary,
    // this.bonus,
    // this.tenure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScaleSize.getHorizontalWidth(
        context: context,
        width: 1350,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: const Color(0xFFEDEDED)),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF068BCA), Color(0xFFF18800)],
          stops: [0.18, 0.825],
        ),
      ),
      child: Row(
        children: [
          Expanded(child: customHeaderChilds("Employee Id", empId)),
          verticalDivider(),
          Expanded(child: customHeaderChilds("Name", empName)),
          verticalDivider(),
          Expanded(child: customHeaderChilds("Position", empPositon)),
          verticalDivider(),
          Expanded(child: customHeaderChilds("Department", empDept)),
          // verticalDivider(),
          // customHeaderChilds("Min Grade", minGrade!),
          // verticalDivider(),
          // customHeaderChilds("Max Grade", maxGrade!),
          // verticalDivider(),
          // customHeaderChilds("Tenure", tenure),
          // verticalDivider(),
          // customHeaderChilds("Gross Salary", grossSalary),
          // verticalDivider(),
          // customHeaderChilds("Bonus", bonus),
          // verticalDivider(),
          // customHeaderChilds("Total Salary", totalSalary),
        ],
      ),
    );
  }
}

Widget customHeaderChilds(String title, String value) {
  return Container(
    margin: const EdgeInsets.only(left: 12, right: 12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ColorConstant.white,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          value,
          style: GoogleFonts.inter(
              fontSize: 21,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.021,
              color: ColorConstant.white),
        ),
      ],
    ),
  );
}

Widget verticalDivider() {
  return Container(
    height: 58, // Adjust the height as needed
    width: 0,
    padding: const EdgeInsets.only(right: 12),
    decoration: const BoxDecoration(
      border: Border(
        left: BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
    ),
  );
}
