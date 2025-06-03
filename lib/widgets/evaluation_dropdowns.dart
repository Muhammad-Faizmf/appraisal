import 'package:flutter/material.dart';

class EvaluationDropdowns extends StatefulWidget {
  const EvaluationDropdowns({super.key});

  @override
  _EvaluationDropdownsState createState() => _EvaluationDropdownsState();
}

class _EvaluationDropdownsState extends State<EvaluationDropdowns> {
  String? firstEvaluation;
  String? secondEvaluation;

  final List<String> evaluations = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // First Dropdown
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text("Select 1st"),
              value: firstEvaluation,
              items: evaluations.map((val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(val),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  firstEvaluation = val;
                });
              },
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
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text("Select 2nd"),
              value: secondEvaluation,
              items: evaluations.map((val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(val),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  secondEvaluation = val;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
