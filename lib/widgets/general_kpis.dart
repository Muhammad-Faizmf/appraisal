import 'package:Appraisal/appraisal/provider/appriasal_provider.dart';
import 'package:Appraisal/widgets/custom_frame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneralKPIs extends StatelessWidget {
  const GeneralKPIs({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppraisalProvider>(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: provider.groupedKpis?.length ?? 0,
      itemBuilder: (_, index) {
        return CustomFrame(
          header: provider.groupedKpis![index].groupHeader,
          kpis: provider.groupedKpis![index].kpis,
          index: index,
        );
      },
    );
  }
}
